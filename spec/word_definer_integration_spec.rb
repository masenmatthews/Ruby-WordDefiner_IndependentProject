require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word is added to list when add button is clicked', {:type => :feature}) do
  it('adds input text to list') do
    visit('/')
    fill_in('word_input', :with => 'dog')
    click_button('Add word')
    expect(page).to have_content('dog')
  end
end
