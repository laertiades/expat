class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.htm { render template: 'errors/not_found', layout: 'layouts/application', status: 404, :formats => :html }
      format.xls { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.xlsx { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
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
