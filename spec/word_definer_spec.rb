require('rspec')
require('word')
require('pry')

describe('Word') do
  describe('#initalize') do
      it('initializes new object under Word class') do
        word = Word.new({:word => 'Dog', :definition => "A soft, friendly animal", :id => nil})
        expect(word.word).to(eq('Dog'))
      end
    end

  describe('#save') do
    it('populates list with inputted term') do
      word = Word.new({:word => 'Dog', :definition => "A soft, friendly animal", :id => nil})
       expect(word.save()).to(eq([word]))
    end
  end

  describe('.clear') do
    it("clears list") do
      word = Word.new({:word => 'Dog', :definition => "A soft, friendly animal", :id => nil})
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe('.all') do
    it('creates empty list') do
      word = Word.new({:word => 'Dog', :definition => "A soft, friendly animal", :id => nil})
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".find") do
    it('finds inputted word by id') do
      word_one = Word.new({:word => 'Dog', :definition => "A soft, friendly animal", :id => nil})
      word_one.save()
      word_two = Word.new({:word => 'Cat', :definition => "An interesting, independent animal", :id => nil})
      word_two.save()
      expect(Word.find(1)).to(eq(word_one))
      expect(Word.find(2)).to(eq(word_two))
    end
  end

end
