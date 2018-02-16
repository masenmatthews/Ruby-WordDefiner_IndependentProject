require('sinatra')
require('sinatra/reloader')
require('rspec')
require('pry')
also_reload('lib/**/*.rb')
require('./lib/definition_class')
require('./lib/word_class')

get('/') do
  list_of_words = Word.list
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

# get('/word/:word') do
#   @word_list = []
#   @inputted_word = params.fetch("word_input")
#   erb(:definition_input)
# end

post('/word/defioitions') do
  album = params("album_input")
  erb(:definition_input)
end
