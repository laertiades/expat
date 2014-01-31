class ConsultantsController < ApplicationController
  http_basic_authenticate_with name: ENV['TRACKER_USERNAME'], password: ENV['TRACKER_PASSWORD']
  layout "tracker"
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

  private

    def consultant_params
      params.require(:consultant).permit(:name, :password, :password_confirmation)
    end

end
