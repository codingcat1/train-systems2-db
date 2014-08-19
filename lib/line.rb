class Line
  attr_reader :name

  def initialize(attributes)
    @name = attributes[:name]
  end

  def self.all
    lines = []
    results = DB.exec("SELECT * FROM lines;")
      results.each do |result|
        attributes = {:name => result['name']}
        current_line = Line.new(attributes)
        lines << current_line
      end
    lines
  end

  def save
    results = DB.exec("INSERT INTO lines (name) VALUES ('#{@name}');")
  end

  def ==(another_line)
    self.name == another_line.name
  end

end
