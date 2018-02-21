require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word_class')
require('rspec')
require('pry')

get('/') do
  @word_list = Word.list
  erb(:word_input)
end
# functional ^^^

post('/') do
  word = params["word_input"]
  word_value = Word.new({:term => word})
  word_value.populate()
  list_of_words = Word.list
  @word_list = list_of_words
  erb(:word_input)
end

get('/word_input/:word') do
  @word_list = []
  @word_value = params.fetch(:term)
  list_of_definitions = Word.list
  @definition_list = list_of_definitions
  erb(:definition_input)
end

get("/definitions/:id")  do
  @word = Word.find(params[:id])
  erb(:item)
end

post("/definitions") do
  definition = params["add_def"]
  definition_value = Word.new({:term => definition})
  definition_value.populate.list()
  list_of_definitions = Word.list
  @word_list = list_of_definitions
  erb(:definition_input)
end

post('/clear') do
  Word.clear
  redirect '/'
end
