require 'spec_helper'

describe UsersController do

	describe "GET #show" do
		
		before :each do
			@user = FactoryGirl.create(:user, :id => 1)
			get :show, {}, { :user_id => 1 }
		end

		it "renders the show template" do
			should render_template('show')
		end

		it "should set session to 1" do
			should set_session(:user_id).to(1)
		end
	end
end