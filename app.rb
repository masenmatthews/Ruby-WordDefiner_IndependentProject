require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('rspec')
require('pry')

# homepage load
get('/') do
  @list = Word.all()
  erb(:homepage)
end

# front page submit button
post('/') do
  word = params("word")
  binding.pry
  value = Word.new({:word => word})
  value.save()
  erb(:homepage)
end

# definitions page load
get("/definitions/:id")  do
  word = params("word")
  @item = Word.find(params[:id])
  erb(:definitions)
end


# clear
post('/clear') do
  Word.clear
  redirect '/'
end
