class Word

  attr_accessor :word, :definition
  attr_reader :id

  @@list = []

  def initialize(attributes)
    @word = attributes[:word]
    @definition = attributes[:definition]
    @id = @@list.length + 1
  end

  def ==(new_word)
    self.word().==(new_word.word()).&(self.definition().==(new_word.definition())).&(self.id().==(new_word.id()))
  end

  def save
    if (self.word)
      @@list.push(self)
    end
  end

  def self.clear()
    @@list.clear
  end

  def add_definition(attributes)
    @definition = Word.new(attributes)
    @@list.push(@definition)
  end

  def self.find(id)
    item_id = id.to_i()
    @@list.each do |item|
      if item_id == item_id
        return id
      end
    end
  end
end
