class Stop
  attr_reader :station_id, :line_id

  def initialize(attributes)
    @station_id = attributes[:station_id]
    @line_id = attributes[:line_id]
  end

  def self.all
    stops = []
  end


end
