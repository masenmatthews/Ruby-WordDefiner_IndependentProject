require('rspec')
require('artist')
require('album')
require('pry')

describe('Word') do

  describe('#initalize') do
    it('initializes a new word object') do
      word = Word.new({:name => 'Mewithoutyou', :genre => 'rock'})
      expect(artist.name).to(eq('Mewithoutyou'))
      expect(artist.genre).to(eq('rock'))
    end
  end
