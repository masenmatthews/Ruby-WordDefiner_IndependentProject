require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('rspec')
require('pry')

# functional #
get('/') do
  @word_list = Word.list
  erb(:homepage)
end
# functional #

post('/') do
  word = params["add_word"]
  word_value = Word.new({:word => word})
  word_value.save()
  list_of_words = Word.list
  @word_list = list_of_words
  erb(:homepage)
end

# should be functional
get("/definitions/:id")  do
  @definition_list = Word.list
  @item = Word.find(params[:id])
  erb(:definition_input)
end
# should be functional

post("/definitions/:id") do
  definition = params["add_definition"]
  definition_value = Word.new({:word => word})
  definition_value.save()
  list_of_definitions = Word.list
  @definitions_list = list_of_definitions
  erb(:definition_input)
end

# functional - clears page #
post('/clear') do
  Word.clear
  redirect '/'
end
# functional - clears page #
