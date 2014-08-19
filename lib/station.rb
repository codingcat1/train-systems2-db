class Station
  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM stations;")
      results.each do |result|
        attributes = { :name => result['name']}
        current_station = Station.new(attributes)
        stations << current_station
      end
    stations
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}');")

  end

  def ==(another_station)
    self.name == another_station.name
  end
end
