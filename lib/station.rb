class Station
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    stations = []
    results = DB.exec("SELECT * FROM stations;")
      results.each do |result|
        attributes = {:name => result['name'], :id => result['id']}
        current_station = Station.new(attributes)
        stations << current_station
      end
    stations
  end

  def save
    results = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}')
      RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_station)
    (self.name == another_station.name) &&
    (@id == another_station.id)
  end

  def stops
    lines = []
    results = DB.exec("SELECT lines.* FROM stations JOIN stops ON (stations.id = stops.station_id) JOIN lines ON (stops.line_id = lines.id) WHERE stations.id = #{@id};")
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      lines << Line.new(:name => result['name'], :id => result['id'])
    end
    lines
  end


end
