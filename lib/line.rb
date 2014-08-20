class Line
  attr_reader :name, :id

  def initialize(attributes)
    @name = attributes[:name]
    @id = attributes[:id].to_i
  end

  def self.all
    lines = []
    results = DB.exec("SELECT * FROM lines;")
      results.each do |result|
        attributes = {:name => result['name'], :id => result['id']}
        current_line = Line.new(attributes)
        lines << current_line
      end
    lines
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_line)
    (self.name == another_line.name) &&
    (@id == another_line.id)
  end

  def stops
    stations = []
    results = DB.exec("SELECT stations.* FROM lines JOIN stops ON (lines.id = stops.line_id) JOIN stations ON (stations.id = stops.station_id) WHERE lines.id = #{@id};")
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      stations << Station.new(:name => result['name'], :id => result['id'])
    end
    stations
  end

end
