require 'rails_helper'

RSpec.feature 'Missing password login', type: :feature do
  scenario 'user login his account' do
    visit '/'
    expect(page).to have_content('Login')
    expect(page).to have_content('MovieMagic')
    click_link('Unlock the Magic!')
    expect(page).to have_current_path('/login')
    click_button('Login')
    expect(page).to have_css('.alert-danger')
    fill_in 'Password', with: 'foobar'
    click_button('Login')
    expect(page).to have_css('.alert-danger')
  end
end