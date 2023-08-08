require 'rails_helper'

RSpec.feature 'Sign up', type: :feature do
  scenario 'user credentials valid input' do
    visit '/signup'
    expect(page).to have_content('Sign up')
    expect(page).to have_content('MovieMagic')
    fill_in 'Full name', with: 'Ron Mark'
    fill_in 'Email', with: 'foobar@gmail.com'
    fill_in 'Mobile number', with: '09999999999'
    fill_in 'Password', with: 'foobar'
    fill_in 'Confimation', with: 'foobar'
    click_button('Sign up')
    expect(page).to have_current_path('/')
  end
end