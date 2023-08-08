require 'rails_helper'

RSpec.feature 'Login Form', type: :feature do
  scenario 'user login without input credentials' do
    visit '/'
    expect(page).to have_content('Login')
    expect(page).to have_content('MovieMagic')
    click_link('Unlock the Magic!')
    expect(page).to have_current_path('/login')
    click_button('Login')
    expect(page).to have_css('.alert-danger')
  end
end