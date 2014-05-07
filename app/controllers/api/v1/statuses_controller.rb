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
      # @status = @patient.wondscreate(wound_id: params[:wound_id],satage: params[:stage])
      @wound = @patient.wounds.find(params[:wound_id])
      @status = @wound.statuses.create(stage: params[:stage])
      @statuses = @wound.statuses.all
      # render :json => {:status => @statuses.map(&:stage_description)}
      render :json => {:status => @status.wound_id}
      Rails.logger.info @status.wound_id
      
      end

      private

      def status_params
        params.require(:status).permit(:wound_id, 
          :stage, :stage_description, :appearance, 
          :drainage, :odor, :color, :treatment_response, 
          :treatment, :image_url, :length, :width, :depth, 
          :tunnel, :pain, :note, :image, :image_file_name)
      end
    end
  end
end
