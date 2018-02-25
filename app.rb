require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('rspec')
require('pry')

# homepage load
get('/') do
  @word_list = Word.all()
  erb(:homepage)
end

# front page submit button
post('/') do
  word = params("add_word")
  word_value = Word.new({:word => word})
  word_value.save()
  @word_list = Word.all()
  erb(:homepage)
end

# definitions page load
get("/definitions/:id")  do
  word = params("add_word")
  @item = Word.find(params[:id])
  erb(:definition_input)
end

# push definitions to display
post("/definitions/:id") do
  @definition = params.fetch('add_definition')
  @definition_value = Word.new({:word => definition})
  definition_value.save()
  list_of_definitions = Word.save
  @definitions_list = list_of_definitions
  erb(:definition_input)
end

# clear
post('/clear') do
  Word.clear
  redirect '/'
end
