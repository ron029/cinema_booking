require 'rails_helper'

RSpec.feature 'Welcome Page', type: :feature do
  scenario 'displays welcome message' do
    visit '/'
    expect(page).to have_content('Book, Enjoy, Repeat!')
  end
end