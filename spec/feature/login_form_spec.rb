require 'rails_helper'

RSpec.feature 'Login Form', type: :feature do
  scenario 'user login his account' do
    visit '/'
    expect(page).to have_content('Login')
    expect(page).to have_content('MovieMagic')
    click_link('Unlock the Magic!')
    fill_in 'Email', with: 'bonifacioronmark@gmail.com'
    fill_in 'Password', with: 'foobar'
    expect(page).to have_current_path('/login')
    click_button('Login')
  end
end