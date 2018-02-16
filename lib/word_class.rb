class Word
  attr_reader :term, :definitions
  @@list = []

  def initialize(attributes)
    @term = attributes[:term]
    @definitions = []
  end

  def populate_list
    if (self.term)
      @@list.push(self)
    end
  end

  def self.list
    @@list
  end

  def add_definition(attributes)
    new_definition = Definitions.new(attributes)
    @definitions.push(new_definition)
    new_definition
  end

  def self.clear
    @@list.clear
  end
end
