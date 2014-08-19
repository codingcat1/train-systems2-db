class Stop
  attr_reader :station_id, :line_id

  def initialize(attributes)
    @station_id = attributes[:station_id].to_i
    @line_id = attributes[:line_id].to_i
  end

  def self.all
    stops = []
    results = DB.exec("SELECT * FROM stops;")
      results.each do |result|
        attributes = {:station_id => result['station_id'], :line_id => result['line_id']}
        current_stop = Stop.new(attributes)
        stops << current_stop
      end
    stops
  end

  def save
    results = DB.exec("INSERT INTO stops (station_id, line_id)
      VALUES (#{@station_id}, #{@line_id});")
  end

  def ==(another_stop)
    (self.line_id == another_stop.line_id) && (self.station_id == another_stop.station_id)
  end
end
