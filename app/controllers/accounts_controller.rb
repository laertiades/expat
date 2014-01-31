class AccountsController < ApplicationController
  layout "tracker"
  def new
    @account = Account.new
  end
  def index
    @accounts = Account.all
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

  private

    def account_params
      params.require(:account).permit!
    end

end
