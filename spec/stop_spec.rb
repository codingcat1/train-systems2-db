require 'spec_helper'

describe Stop do
  it 'initializes a stop with a line and station' do
    test_line = Line.new(:name => "Red")
    test_station = Station.new(:name => "A")
    test_stop = Stop.new({:station_id => test_station.id,
      :line_id => test_line.id })
    expect(test_stop).to be_an_instance_of Stop
  end

  it 'displays the initialized station and line' do
    test_line = Line.new(:name => "Red")
    test_station = Station.new(:name => "A")
    test_stop = Stop.new({:station_id => test_station.id,
      :line_id => test_line.id})
    expect(test_stop.line_id).to eq test_line.id
    expect(test_stop.station_id).to eq test_station.id
  end

  it 'creates an empty array of stops' do
    expect(Stop.all).to eq []
  end

  it 'saves station_id and line_id to stops table' do
    test_line = Line.new(:name => "Red")
    test_station = Station.new(:name => "A")
    test_stop = Stop.new({:station_id => test_station.id,
      :line_id => test_line.id})
    test_stop.save
    expect(Stop.all).to eq [test_stop]
  end

  it "recognizes two occurrences of a stop as two different objects" do
    test_line = Line.new(:name => "Red")
    test_station = Station.new(:name => "A")
    test_stop = Stop.new ({:station_id => test_station.id,
      :line_id => test_line.id})
    test_stop2 = Stop.new ({:station_id => test_station.id,
      :line_id => test_line.id})
    expect(test_stop).to eq test_stop2
  end

  it 'sets an id to a stop when saved' do
    test_line = Line.new(:name => "Red")
    test_station = Station.new(:name => "A")
    test_stop = Stop.new({:station_id => test_station.id,
      :line_id => test_line.id})
    test_stop.save
    expect(test_stop.id).to be_an_instance_of Fixnum
  end

end


