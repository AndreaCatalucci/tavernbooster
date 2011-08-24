require 'erb'

class InvoiceProducer
  attr_accessor :invoice_data
  def initialize
    template = File.read('templates/invoice.tex.erb')
    @invoice = ERB.new template
  end
  
  def produce
    @invoice_data = {:id => 01}
    @file_name = "invoice#{@invoice_data[:id]}"
    @input_file_name = "tex/#{@file_name}.tex"
    document = @invoice.result(binding)
    File.open(@input_file_name,'w') do |f|
      f.write document
    end
  end
  
  def compile
    @output_file_name = @file_name
    @output_dir = "output"
    @aux_dir = "auxfiles"
    command = "pdflatex #{@input_file_name} -output-directory=#{@output_dir} -job-name=#{@output_file_name}
      -aux-directory=#{@aux_dir}"
    puts command
    system(command)
  end
end

i = InvoiceProducer.new
i.produce
i.compile
