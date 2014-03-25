class ConsultantsController < ApplicationController
  http_basic_authenticate_with name: ENV['TRACKER_USERNAME'], password: ENV['TRACKER_PASSWORD']
  layout "tracker"
  protect_from_forgery with: :exception

  def index
    @consultants = Consultant.all
  end

  def new
    @consultant = Consultant.new
  end
  def create
    @consultant = Consultant.new(consultant_params)
    @consultant.password = "consultant"
    @consultant.password_confirmation = "consultant"
    if @consultant.save
      flash[:success] = "You have created a new consultant"
      redirect_to '/consultants'
    else
      render 'new'
    end
  end

  def edit
    @consultant = Consultant.find(params[:id])
  end
  def update
    @consultant = Consultant.find(params[:id])
    @consultant.password = "consultant"
    @consultant.password_confirmation = "consultant"
    if @consultant.update_attributes(consultant_params)
      flash[:success] = "Consultant Edited successfully"
      redirect_to '/consultants'
    else
      @consultant = Consultant.find(params[:id])
      render 'edit'
    end
  end

  def destroy
    Consultant.find(params[:id]).destroy
    flash[:success] = "Consultant destroyed permanently"
    redirect_to '/consultants'
  end

  private

    def consultant_params
      params.require(:consultant).permit(:name, :password, :password_confirmation)
    end

end
