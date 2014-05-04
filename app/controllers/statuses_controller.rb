class StatusesController < ApplicationController

  def new
    @wound = Wound.find(params[:wound_id])
    @patient = Patient.find(params[:patient_id])
    @status = Status.new
  end

  def index
  end

  def show
    @status = Status.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @status }
    end
  end

  def destroy
    p params
    @status = Status.find(params[:id])
    @status.active = false
    @status.save!
    redirect_to wound_path(@status.wound_id)
  end

  def create
    if request.xhr?
    else
      @status = Status.create(status_params.merge(wound_id: params[:stuff_id]))
      if @status.save
        redirect_to Wound.find(params[:stuff_id])
      else
        render "new"
      end
    end
  end

  private

  def status_params
    params.require(:status).permit(:wound_id, 
      :stage, :stage_description, :appearance, 
      :drainage, :odor, :color, :treatment_response, 
      :treatment, :image_url, :length, :width, :depth, 
      :tunnel, :pain, :note)
  end

end