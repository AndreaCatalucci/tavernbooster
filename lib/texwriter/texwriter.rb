require 'erb'

class InvoiceProducer
  attr_accessor :invoice_data
  
  DATA_FOLDER = "#{Rails.root}/lib/texwriter"
   
  def initialize(invoice_data)
    @invoice_data = invoice_data
    @template = File.read("#{DATA_FOLDER}/templates/invoice.tex.erb")
  end
  
  def produce
    produce_tex
    compile_tex
  end

  private

  def produce_tex
    @invoice = ERB.new @template
    @file_name = "invoice_#{@invoice_data[:id]}"
    @input_file_name = "#{DATA_FOLDER}/tex/#{@file_name}.tex"
    document = @invoice.result(binding)
    File.open(@input_file_name,'w') do |f|
      f.write document
    end
  end
  
  def compile_tex
    output_file_name = @file_name
    output_dir = "#{Rails.root}/public/invoices"
    aux_dir = "#{DATA_FOLDER}/auxfiles"
    command = "pdflatex #{@input_file_name} -output-directory=#{output_dir} -aux-directory=#{aux_dir} -job-name=#{output_file_name}"
    system(command)
  end
end
