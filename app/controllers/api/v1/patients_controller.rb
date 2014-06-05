module Api
  module V1
    class PatientsController < ApplicationController
    
   
      respond_to :json

      def show
        @patient = Patient.find(params[:id])
        @wounds = @patient.wounds
        @woundlocation = @wounds.map(&:location)
        @woundid = @wounds.map(&:id)
        response = { :woundlocation=>  @woundlocation, :ids => @woundid}
        render :json => response
      end

      def index
        #will return all patients for a user
        @user = User.find(params[:id])
         @patient = @user.patients
         render :json => {:status => @patient}
      end
    end
  end
end