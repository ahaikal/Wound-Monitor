class WoundsController < ApplicationController
	def index
		@wounds = Patient.wounds
	end

	def show
		@wound = Wound.find(params[:id])
	end

	def new
		@wound = Wound.new
	end

	def create
		@wound = Wound.create(wound_params)
	end

	def edit

	end

	def destroy
		@wound = Wound.find(params[:id])
		@wound.destroy

	end

	private

	def wound_params
		params.require(:wound).permit :location, :patient

	end
end
