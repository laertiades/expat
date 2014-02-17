class ErrorsController < ApplicationController
  def not_found
      render :status => 404, :layout => "error_frame"
  end

  def unacceptable
      render :status => 422, :layout => "error_frame"
  end

  def internal_error
      render :layout => false, :status => 500
  end
end
