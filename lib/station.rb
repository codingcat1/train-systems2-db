class Station
  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    stations = []
  end

end
