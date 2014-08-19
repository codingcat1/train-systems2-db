class Line
  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    lines = []
  end

end
