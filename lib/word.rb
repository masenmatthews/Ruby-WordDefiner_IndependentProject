class Word
  attr_reader :word, :definition, :id
  @@list = []

  def initialize(attributes)
    @word = attributes[:word]
    @definitions = []
    @id = @@list.length + 1
  end

  def populate
    if (self.term)
      @@list.push(self)
    end
  end

  def self.list
    @@list
  end

  def add_definition(attributes)
    new_definition = Word.new(attributes)
    @definitions.push(new_definition)
    new_definition
  end

  def self.clear
    @@list.clear
  end

  def self.find(id)
    word_id = id.to_i()
    @@list.each do |item|
      if word_id == item_id
      return word
    end
  end
end
