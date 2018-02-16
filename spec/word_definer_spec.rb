require('rspec')
require('word_class')
require('definition_class')
require('pry')

describe('Word') do
  describe('#initalize') do
    it('initializes new object under Word class') do
      word = Word.new({:term => 'Dog'})
      expect(word.term).to(eq('Dog'))
    end
  end
end

describe('#populate_list') do
  it('populates list with inputted term') do
    word = Word.new({:term => 'Dog'})
    word.populate_list
     expect(Word.list()).to(eq([word]))
  end
end
