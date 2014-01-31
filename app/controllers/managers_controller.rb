class ManagersController < ApplicationController
  http_basic_authenticate_with name: ENV['TRACKER_USERNAME'], password: ENV['TRACKER_PASSWORD']
  layout "tracker"
  def index
    @managers = Manager.all
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    @manager.password = "manager"
    @manager.password_confirmation = "manager"
    if @manager.save
      flash[:success] = "You have created a new manager"
      redirect_to '/managers'
    else
      render 'new'
    end
  end

  private

    def manager_params
      params.require(:manager).permit(:name, :password, :password_confirmation)
    end

end
