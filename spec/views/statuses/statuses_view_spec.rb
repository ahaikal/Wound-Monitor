require 'spec_helper'

feature 'User browsing patients wounds' do
  background do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:patient)
  end

  scenario "Statuses View" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link "Test Patient"
    click_link "Record New Wound"
    fill_in 'wound[location]', :with => 'Abdomen'
    click_button 'Record Wound Location'
    click_link "Record New Status"
    expect(page).to have_content 'Create New Status'
  end


  scenario "Statuses View" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link "Test Patient"
    click_link "Record New Wound"
    fill_in 'wound[location]', :with => 'Abdomen'
    click_button 'Record Wound Location'
    click_link "Record New Status"
    click_button "Create Status"
    expect(page).to have_content 'Wound Statuses'
  end

end
