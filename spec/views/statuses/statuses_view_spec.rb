require 'spec_helper'

feature 'User browsing patients wounds' do

  background do
    @user = FactoryGirl.create(:user)
    @patient = FactoryGirl.create(:patient, :user_id => @user.id)
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end

  end

  scenario "Statuses View" do
    click_button 'Login'
    click_link @patient.name
    click_link "Record New Wound"
    fill_in 'wound[location]', :with => 'Abdomen'
    click_button 'Record Wound Location'
    click_link "Record New Status"

    expect(page).to have_content 'Create New Status'
  end


  scenario "Statuses View" do
    click_button 'Login'
    click_link @patient.name
    click_link "Record New Wound"
    fill_in 'wound[location]', :with => 'Abdomen'
    click_button 'Record Wound Location'
    click_link "Record New Status"

    expect(page).to have_content 'Wound location: Abdomen'
  end

end
