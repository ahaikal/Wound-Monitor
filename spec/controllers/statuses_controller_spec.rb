describe StatusesController do 

	describe "GET #new" do
		before :each do
			@wound = FactoryGirl.create(:wound)
			@patient = FactoryGirl.create(:patient, :id => 1)
			@status = FactoryGirl.create(:status)
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
			get :show, {:id => 1}
		end

		it { should render_template 'show'}

		it "should find Status with corresponding id" do
			expect(@status.id).to be 1
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
end



