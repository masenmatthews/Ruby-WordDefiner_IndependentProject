class Definition
  attr_reader :term_definition
  @@list = []

  def initialize(attributes)
    @term_definition = attributes[:term_definition]
  end

  def populate_list
    @@list.push(self)
  end

  def self_list
    @@list
  end
end
