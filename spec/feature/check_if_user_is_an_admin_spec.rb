require 'rails_helper'

RSpec.describe 'Admin Dashboard', type: :feature do
  before(:each) do
    create(:admin, email: 'admin@admin.com', password: 'foobar')
  end

  scenario 'checks if an admin can access the admin dashboard' do
    # Login as an admin
    visit('/login')
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Password', with: 'foobar'
    click_button('Login')
    expect(page).to have_current_path('/')
    expect(page).to have_content('Admin Dashboard')
  end

  scenario 'checks if a non-admin user cannot access the admin dashboard' do
    # Login as a non-admin user
    visit('/login')
    fill_in 'Email', with: 'user@user.com'
    fill_in 'Password', with: 'password'
    click_button('Login')
    expect(page).to have_current_path('/')
    expect(page).not_to have_content('Admin Dashboard')
  end
end