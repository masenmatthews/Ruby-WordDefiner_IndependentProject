require('rspec')
require('word')
require('pry')

describe('Word') do
  describe('#initalize') do
      it('initializes new object under Word class') do
        word = Word.new({:word => 'Dog'})
        expect(word.word).to(eq('Dog'))
      end
    end

  describe('#save') do
    it('populates list with inputted term') do
      word = Word.new({:word => 'Dog'})
      word.save
       expect(Word.list()).to(eq([word]))
    end
  end


end
