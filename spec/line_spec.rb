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

  it 'returns all stations on a line' do
    test_station = Station.new({:name => "A"})
    test_line = Line.new ({:name => "Red"})
    test_station.save
    test_line.save
    test_stop = Stop.new({:station_id => test_station.id, :line_id => test_line.id})
    test_stop.save

    test_station2 = Station.new ({:name => "B"})
    test_station2.save
    test_stop2 = Stop.new({:station_id => test_station2.id, :line_id => test_line.id})
    test_stop2.save
    expect(test_line.stops).to eq [test_station, test_station2]
   end
end
