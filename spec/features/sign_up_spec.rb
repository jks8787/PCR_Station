require 'spec_helper'

feature 'user signs up' do

  scenario 'successfully' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: "test1@test.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "password"
    click_button 'Sign up'
    expect(page).to have_content "Signed in as test1@test.com"
    expect(page).to have_link 'sign out'
  end

  scenario 'unsuccessfully' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Email', with: "test2@test.com"
    fill_in 'Password', with: "password"
    fill_in 'Password confirmation', with: "some-password"
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to_not have_content "Signed in as"
  end

end
