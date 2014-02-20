class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :force_tablet_html
  has_mobile_fu
end

def force_tablet_html
    session[:tablet_view] = false
end
