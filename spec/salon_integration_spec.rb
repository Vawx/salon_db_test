require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set( :show_expceptions, false )

RSpec.configure do |config|
  config.after(:each) do
    config.after(:each) do
      DBSALON.exec("DELETE FROM stylists *;")
      DBSALON.exec("DELETE FROM clients *;")
    end
  end
end

feature 'adding a new client' do
  scenario 'allows addition of new client' do
    visit '/'
    fill_in 'client_name', with: "kyle"
    click_button 'Add Client'
    expect(page).to have_content('kyle')
  end
end

feature 'adding a new stylist' do
  scenario 'allows addition of new stylist' do
    visit '/'
    fill_in 'stylist_name', with: "edward"
    click_button 'Add Stylist'
    expect(page).to have_content('edward')
  end
end
