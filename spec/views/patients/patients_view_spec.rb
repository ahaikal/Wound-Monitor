require 'spec_helper'

feature 'User browsing the website' do
  background do
    @user = User.create!(:email => 'geovanni_haag@thiel.org', :password => 'password')
    Patient.create!(first_name: "Test", last_name: "Patient", sex: "Male", room_number: 4, age: 45, user_id: @user.id)
  end

  scenario "sees a list of patients" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => 'geovanni_haag@thiel.org'
      fill_in 'user[password]', :with => 'password'
    end
    click_button 'Login'

    expect(page).to have_content 'Here are your current patients'
    click_link "Test Patient"
    expect(page).to have_content 'Test Patient'
    
  end
end
 