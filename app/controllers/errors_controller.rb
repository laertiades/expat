class ErrorsController < ApplicationController
  def not_found
      render :status => 404, :layout => false
  end

  def unacceptable
      render :status => 422
  end

  def internal_error
      render :layout => false, :status => 500
  end
end
