module Api
  module V1
    class PatientsController < ApplicationController

      respond_to :json

      def show
        respond_with @patient = Patient.find(params[:id])
      end

      def index
        respond_with Patient.all
      end
    end
  end
end