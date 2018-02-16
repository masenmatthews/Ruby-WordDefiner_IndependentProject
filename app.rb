require('sinatra')
require('sinatra/reloader')
require('rspec')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition_class')
require('./lib/word_class')

get('/') do
  @word_list = Word.list
  erb(:word_input)
end

post('/') do
  word = params["word"]
  word_value = Word.new({:term => word})
  word_value.populate_list()
  list_of_words = Word.list
  @word_list = list_of_words
  erb(:word_input)
end
