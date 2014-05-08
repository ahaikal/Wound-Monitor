require 'spec_helper'

feature 'User browsing the website' do
  background do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:patient)
  end

  scenario "sees a list of patients" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'

    expect(page).to have_content 'Here are your current patients'
    click_link "Test Patient"
    expect(page).to have_content 'Test Patient'

  end
end
