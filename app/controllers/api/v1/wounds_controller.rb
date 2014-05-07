module Api
  module V1
    class WoundsController < ApplicationController

      skip_before_action :verify_authenticity_token

      respond_to :json

        def show
            @wound = Wound.find(params[:id])
            render :json => {:status => @wound.patient.id}
            
          end
    end
  end
end