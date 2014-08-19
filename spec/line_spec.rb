require 'spec_helper'


describe Line do
  it 'initializes an line with a name' do
    test_line = Line.new({:name => "Red"})
    expect(test_line).to be_an_instance_of Line
  end


end
