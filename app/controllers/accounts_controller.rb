class AccountsController < ApplicationController
  http_basic_authenticate_with name: ENV['TRACKER_USERNAME'], password: ENV['TRACKER_PASSWORD']
  layout "tracker"
  protect_from_forgery with: :exception

  def index
    @accounts = Account.all
    render layout: "widescreen"
  end

  def new
    @account = Account.new
  end
  def create
    @account = Account.new(account_params)
    if @account.save
      flash[:success] = "You have created a new account"
      redirect_to '/accounts'
    else
      render 'new'
    end
  end

  def edit
    @account = Account.find(params[:id])
  end
  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      flash[:success] = "Account was updated successfully"
      redirect_to '/accounts'
    else
      render 'edit'
    end
  end

  def destroy
    Account.find(params[:id]).destroy
    flash[:success] = "Account destroyed permanently"
    redirect_to '/accounts'
  end

  private

    def account_params
      params.require(:account).permit!
    end

end
