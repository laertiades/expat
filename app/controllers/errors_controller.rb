class ErrorsController < ApplicationController
  def not_found
      render :status => 404
  end

  def unacceptable
    respond_to do |format|
      format.html { render template: 'errors/unacceptable', layout: 'layouts/application', status: 422 }
      format.all  { render nothing: true, status: 422 }
    end
  end

  def internal_error
    respond_to do |format|
      format.html { render template: 'errors/internal_error', layout: false, status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end
end
