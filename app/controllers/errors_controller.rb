class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.any(:htm, :html, :xls, :xlsx) { render :status => 404, :layout => "error_frame", :formats => [:html] }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def unacceptable
    respond_to do |format|
      format.html { render :status => 422, :layout => "error_frame" }
      format.all  { render nothing: true, status: 422 }
    end
  end

  def internal_error
    respond_to do |format|
      format.html { render :layout => false, :status => 500 }
      format.all  { render nothing: true, status: 500}
    end
  end
end
