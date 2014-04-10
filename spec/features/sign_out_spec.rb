require 'spec_helper'

feature 'user signs out' do

  background do
    @user = create(:user)
  end

	scenario 'successfully' do
		visit root_path
    click_link 'Sign In?'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    visit root_path
		click_link 'sign out'
		expect(page).to_not have_content "Signed in as"
	end
end
