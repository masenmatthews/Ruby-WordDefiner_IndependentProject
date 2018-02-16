require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/definition_class')
require('./lib/word_class')
require('rspec')
require('pry')

get('/') do
  @word_list = Word.list
  erb(:word_input)
end

post('/') do
  word = params["word_input"]
  word_value = Word.new({:term => word})
  word_value.populate_list()
  list_of_words = Word.list
  @word_list = list_of_words
  erb(:word_input)
end

get('/word_input/:term') do
  @word_list = []
  @word_value = params.fetch(:term)
  list_of_definitions = Word.list
  @definition_list = list_of_definitions
  erb(:definition_input)
end

post('/clear') do
  Word.clear
  redirect '/'
end
