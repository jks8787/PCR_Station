require 'spec_helper'

feature 'user signs in' do

  background do
    @user = create(:user)
  end

  scenario 'successfully' do
    visit root_path
    click_link 'Sign In?'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    expect(page).to have_content "Signed in as #{@user.email}"
    expect(page).to have_link 'sign out'
  end

  scenario 'unsuccessfully' do
    visit root_path
    click_link 'Sign In?'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'something'
    click_button 'Sign in'
    expect(page).to_not have_content "Signed in as"
  end

end
