module Api
  module V1
    class UsersController < ApplicationController

      respond_to :json

      def show
        @user = User.find(params[:id])
        @patients = @user.patients
        @names = @patients.map(&:name)
        @ids = @patients.map(&:id)
        response = { :patientname=>  @names, :ids => @ids}
         render :json => response
      end

    end
  end
end