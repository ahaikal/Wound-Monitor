require 'spec_helper'

describe WoundsController do
	describe "GET #show" do
		before :each do
			@wound = FactoryGirl.create(:wound, :id => 1)
			get :show, { :id => 1 }, {}
		end

		it "should render show template" do
			should render_template('show')
		end

		it "should find Wound with id of 1" do
			expect(@wound.id).to be 1
		end
	end

	describe "GET #new" do
		before { get :new }
		it "should render new template" do
			should render_template('new')
		end
	end

	describe "POST #create" do
		context "permits location & patient id" do
			it { should permit(:location, :patient_id).for(:wound)}
		end
	end

end
