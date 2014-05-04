class WoundsController < ApplicationController

	def show
		@wound = Wound.find(params[:id])
		respond_to do |format|
      format.html
      format.json { render json: @wound.statuses }
    end
	end

	def new
		@wound = Wound.new
	end

	def create
		@wound = Wound.new(wound_params.merge(patient_id: params[:patient_id]))
		if @wound.save
			redirect_to @wound
		else
			render "new"
		end
	end

	def destroy
		@wound = Wound.find(params[:id])
		@wound.destroy
	end

	private

	def wound_params
		params.require(:wound).permit :location, :patient_id
	end
end
