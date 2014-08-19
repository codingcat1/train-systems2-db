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
end
