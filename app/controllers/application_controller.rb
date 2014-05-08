class ApplicationController < ActionController::Base
  before_filter :set_format
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception
#  before_filter :force_tablet_html
#  has_mobile_fu
  include SimpleCaptcha::ControllerHelpers
  def set_format
    if request.env['mobvious.device_type'] == :mobile
      request.format = :mobile
    end
  end
end

def force_tablet_html
    session[:tablet_view] = false
end
