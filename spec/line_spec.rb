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

  it "starts out with an empty array of lines" do
    test_line = Line.new({:name => "Red"})
    expect(Line.all).to eq []
  end

  it 'saves the line to the lines table' do
    test_line = Line.new ({:name => "Red"})
    test_line.save
    expect(Line.all).to eq [test_line]
  end

  it "recognizes two occurrences of a line as two different objects" do
    test_line = Line.new ({:name => "Red"})
    test_line2 = Line.new ({:name => "Red"})
    expect(test_line).to eq test_line2
  end

  it 'sets the id to a line when its saved' do
    test_line = Line.new ({:name => "Red"})
    test_line.save
    expect(test_line.id).to be_an_instance_of Fixnum
  end

end
