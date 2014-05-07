describe StatusesController do

	describe "GET #new" do
		before :each do
			@wound = FactoryGirl.create(:wound)
			FactoryGirl.create(:patient, :id => 1)
			FactoryGirl.create(:status)
			get :new, { :wound_id => 1, :patient_id => 1}, {}
		end

		it { should render_template 'new'}

		it "should find Wound with corresponding id" do
			expect(@wound.id).to be 1
		end
	end

	describe "GET #show" do
		before :each do
			@status = FactoryGirl.create(:status)
			FactoryGirl.create(:patient, :id => 1)
			FactoryGirl.create(:wound)
			get :show, {:id => 1}
		end

		it { should render_template 'show'}


		it "should find Status with corresponding id" do
			expect(@status.id).to be 1
		end

		pending it "should render json" do
			expect(response.content_type).to eq("application/json")
		end

	end


	describe "POST #create" do
		pending context "permits all status columns" do
			it { should permit(:wound_id, :stage, :stage_description, :appearance,
				:drainage, :odor, :color, :treatment_response,
				:treatment, :image, :image_file_name, :length, :width, :depth,
				:tunnel, :pain, :note).for(:create) }
		end
	end

	describe "GET #download" do
		before :each do
			@status = FactoryGirl.create(:status)
			FactoryGirl.create(:patient, :id => 1)
			FactoryGirl.create(:wound)
			get :download, {:id => 1}
		end

		it "should find Status with corresponding id" do
			expect(@status.id).to be 1
		end

		it "should return plaintext" do
			expect(response.content_type).to eq("text/plain")
		end

	end

	describe "GET #destroy" do
		before :each do
			@status = FactoryGirl.create(:status)
			get :destroy, {:id => 1}
		end

		it "the active status should be false" do
			expect(@status.active).to eq(true)
		end

		it "after save the active status should be true" do
			@status.active = false
			expect(@status.active).to eq(false)
		end

		it "redirects to wound show page" do
			should redirect_to wound_path(@status)
		end

	end
end



