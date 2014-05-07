module Api
  module V1
    class PatientsController < ApplicationController

      respond_to :json

      def show
        @patient = Patient.find(params[:id])
        render :json => {:status => @patient.wounds}
      end

      def index
        respond_with Patient.all
      end
    end
  end
end