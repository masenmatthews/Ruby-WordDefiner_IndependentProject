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

  describe('#populate_list') do
    it('populates list with inputted term') do
      word = Word.new({:term => 'Dog'})
      word.populate_list
       expect(Word.list()).to(eq([word]))
    end
  end

  # describe('#add_definition') do
  #   it('adds new definition for inputted word') do
  #     word = Word.new({:term => 'Dog'})
  #     inputted_word = word.add_definition({:definitions => ["A soft, friendly animal"]})
  #     binding.pry
  #     expect(term.Definition).to(eq([inputted_word]))
  #     end
  #   end
end
