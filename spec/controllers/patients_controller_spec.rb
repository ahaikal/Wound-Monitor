require 'spec_helper'

describe PatientsController do

	describe "GET #show" do
		
		before :each do
			@patient = FactoryGirl.create(:patient, :id => 2)
			get :show, {:id => 2}, {}
			
		end

		it "renders the show template" do
			should render_template('show')
		end

		it "should have Patient with same id of params" do
			expect(@patient.id).to be 2
		end
	end
end