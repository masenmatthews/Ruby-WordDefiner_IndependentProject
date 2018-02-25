require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Inputted word is added to list', {:type => :feature}) do
  it('adds clickable word to list and navigates to unique page') do
    visit('/')
    fill_in('word', :with => 'dog')
    click_button('Add')
    expect(page).to have_content('dog')
  end
end
