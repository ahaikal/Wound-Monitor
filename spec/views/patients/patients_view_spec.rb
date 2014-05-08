require 'spec_helper'

feature 'User browsing the website' do
  background do
    @user = FactoryGirl.create(:user)
    @patient = FactoryGirl.create(:patient, :user_id => @user.id)
  end

  scenario "sees a list of patients" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'

    expect(page).to have_content 'Welcome to the Wound Management System!'
    click_link @patient.name
    expect(page).to have_content @patient.name

  end
end
