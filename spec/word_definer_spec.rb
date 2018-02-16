require('rspec')
require('word_class')
require('definition_class')
require('pry')

describe('Word') do

  describe('#initalize') do
    it('initializes a new word object') do
      word = Word.new({:term => 'Dog'})
      expect(word.term).to(eq('Dog'))
    end
  end
end
