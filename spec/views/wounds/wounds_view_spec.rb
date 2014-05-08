require 'spec_helper'

feature 'User browsing the website' do
  background do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:patient)
  end

  scenario "sees a list of patients wounds" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link "Test Patient"
    expect(page).to have_content 'Patient Name: Test Patient'

  end

  scenario "Create new wound" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link "Test Patient"
    click_link "Record New Wound"
    expect(page).to have_content 'Enter Wound Information'
  end

  scenario "Create new wound" do
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
    expect(page).to have_content 'Wound Statuses'
  end

end
