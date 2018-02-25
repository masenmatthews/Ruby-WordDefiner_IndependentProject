require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word')
require('rspec')
require('pry')

get('/') do
  @list = Word.all()
  erb(:homepage)
end

post('/definitions/:id') do
  word = params["word"]
  value = Word.new({:word => word})
  value.save()
  @list = Word.all()
  erb(:homepage)
end

get('/definitions/:id') do
  @list = Word.all()
  erb(:definitions)
end

post('/definitions_input/:id') do
  definition = params["definition"]
  definition = Word.new({:definition => definition})
  @list = definition.save()
  erb(:definitions)
end

post('/clear') do
  Word.clear
  redirect '/'
end
