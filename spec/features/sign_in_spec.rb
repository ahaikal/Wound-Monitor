require 'spec_helper'

feature "Signing in" do
  background do
    User.create!(:email => 'geovanni_haag@thiel.org', :password => 'password')
  end

  scenario "Signing in with correct credentials" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => 'geovanni_haag@thiel.org'
      fill_in 'user[password]', :with => 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'Welcome back'
  end

  given(:other_user) { User.create!(:email => 'other@example.com', :password => '1234rous') }

  scenario "Signing in with wrong information" do
    visit '/sessions/create'
    within(".new_user") do
      fill_in 'user[email]', :with => other_user.email
      fill_in 'user[password]', :with => "were"
    end
    click_button 'Login'
    expect(page).to have_content 'Staff Login'
  end

    scenario "Signing Out a user" do
      visit '/sessions/create'
      within(".new_user") do
      fill_in 'user[email]', :with => 'geovanni_haag@thiel.org'
      fill_in 'user[password]', :with => 'password'
    end
    click_button 'Login'
    click_link 'Logout'
      expect(page).to have_content 'Staff Login'
    end
end