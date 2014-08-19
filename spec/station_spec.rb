require 'spec_helper'


describe Station do

  it 'initializes a station with a name' do
    test_station = Station.new({:name => "A"})
    expect(test_station).to be_an_instance_of Station
  end

  it "shows the user the station they initialized" do
    test_station = Station.new({:name => "A"})
    expect(test_station.name).to eq "A"
  end

  it "starts out with an empty array of stations" do
    test_station = Station.new({:name => "A"})
    expect(Station.all).to eq []
  end

  it 'saves the station to the stations table' do
    test_station = Station.new ({:name => "A"})
    test_station.save
    expect(Station.all).to eq [test_station]
  end

  it "recognizes two occurrences of a station as two different objects" do
    test_station = Station.new ({:name => "A"})
    test_station2 = Station.new ({:name => "A"})
    expect(test_station).to eq test_station2
  end

  it 'sets the id to a station when its saved' do
    test_station = Station.new ({:name => "A"})
    test_station.save
    expect(test_station.id).to be_an_instance_of Fixnum
  end

end
