class PatientsController < ApplicationController

  def index
    p "~~~~~~~~~~~~~~~~~~~~~~~~~"
    p session[:user_id]
    @user = User.find(session[:user_id])
    @patients = user_patients_path(@user)
  end

  def show
    @patients = @user.patients
    render user_patients_path
  end

end