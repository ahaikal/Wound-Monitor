module Api
  module V1
    class StatusesController < ApplicationController

      skip_before_action :verify_authenticity_token

      respond_to :json

      def new
        @wound = Wound.find(params[:wound_id])
        @patient = Patient.find(params[:patient_id])
        @status = Status.new
      end

      def index
        respond_with Status.all
      end

      def show
        @status = Status.find(params[:id])
      end

      def create
      @patient = Patient.find(params[:patient_id])
      
      @wound = @patient.wounds.find(params[:wound_id])
      @status = @wound.statuses.create!(status_params)
      # @statuses = @wound.statuses.all
      
      render :json => {:status => true}
      Rails.logger.info @status.wound_id
      
      end

      private

      def status_params
        params.require(:status).permit(:wound_id, 
          :stage, :stage_description, :appearance, 
          :drainage, :odor, :color, :treatment_response, 
          :treatment, :length, :width, :depth, 
          :tunnel, :pain, :note, :image, :image_file_name)
      end
    end
  end
end
