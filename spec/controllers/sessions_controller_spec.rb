require 'spec_helper'
include SessionTestHelper

describe SessionsController do

	describe "GET #index" do
		before { get :index }
		it "renders the index view" do
			should render_template('index')
		end
	

		context "if user enters email" do
			it "finds by email and returns true" do
				@user = FactoryGirl.create(:user)
				expect(login(@user)).to eq(true)
			end
		end
	end

		# context "if not logged in" do
		# 	#before(:all) do
		# 		session[:key] = 1
		# 		it "renders index path" do
		# 			#session[:user_id] == nil
		# 			expect(session[:key]).to eq(1)
		# 			should render_template('index')
		# 			end
		# 		#end
		# end

	# 	context "if logged in" do 
	# 		it "user redirected to user_path"  
	# 			#if current_user
	# 			expect()
	# 			#response.should redirect_to(user_path(:user))
	# 	end

	describe "POST #create" do

		context "if authenticated" do 
			#before { get :create }
			it "user redirected to user_path" do
				@user = FactoryGirl.create(:user)
				#should render_template('show')
				redirect_to(user_path(@user))
			end
		end

		context "if NOT authenticated" do
			pending it "user redirected to index" do
				@user = FactoryGirl.create (:user)
				should render_template('index')
			end
		end
		

		context "permits email & password" do
			it { should permit(:email, :password).for(:create)}
		end
	end


	describe "POST #destroy" do
		it "redirects to root upon logout" do
			redirect_to root_url
		end
	end

end
