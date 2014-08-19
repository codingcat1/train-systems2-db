require 'spec_helper'


describe Line do
  it 'initializes a line with a name' do
    test_line = Line.new({:name => "Red"})
    expect(test_line).to be_an_instance_of Line
  end

  it "shows the user the line they initialized" do
    test_line = Line.new({:name => "Red"})
    expect(test_line.name).to eq "Red"
  end

end
