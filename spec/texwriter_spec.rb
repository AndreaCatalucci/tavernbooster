require 'texwriter'

describe Bowling, "#score" do
  it "returns 0 for all gutter game" do
    texwriter = TexWriter.new
    texwriter
    20.times { bowling.hit(0) }
    bowling.score.should == 0
  end
end