require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition_class')
require('./lib/word_class')
require('rspec')
require('pry')

get('/') do
  list_of_words = Word.list
end

post('/') do
  word = params("definition_input")
  word_value = Word.new({:term => word})
  word_value.populate_list()
  Word.sort_list
  list_of_words = Word.list
  erb(:word_input)
end
