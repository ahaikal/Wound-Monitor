class PatientsController < ApplicationController

  def show
    @patient = Patient.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @patient.wounds }
    end
  end

end