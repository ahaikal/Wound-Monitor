require 'spec_helper'

feature 'User browsing the website' do
  background do
    @user = FactoryGirl.create(:user)
    @patient = FactoryGirl.create(:patient, :user_id => @user.id)

    #@user = User.create!(first_name: "John", last_name: "Davis", email: "james@gmail.com", password: "password")
    #@patient = Patient.create!(first_name: "John", last_name: "Davis", user_id: @user.id)
  end

  scenario "sees a list of patients wounds" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link @patient.name
    expect(page).to have_content "Patient Name: #{@patient.name}"

  end

  scenario "records a new wound" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link @patient.name

    click_link "Record New Wound"
    expect(page).to have_content 'Enter Wound Location'
  end

  scenario "checks that statuses are on new wound page" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => @user.email
      fill_in 'user[password]', :with => @user.password
    end
    click_button 'Login'
    click_link @patient.name
    click_link "Record New Wound"
    fill_in 'wound[location]', :with => 'Abdomen'
    click_button 'Record Wound Location'
    expect(page).to have_content 'Wound Statuses'
  end

end
