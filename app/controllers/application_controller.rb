# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  before_filter :login_required
  before_filter :setup_current_user
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  private

  def authorized?
    session[:user_id] || controller_name == "sessions"
  end

  def login_required
    authorized? || access_denied
  end

  def access_denied
    respond_to do |format|
      format.html do
        session[:return_to] = request.request_uri
        redirect_to new_session_path
      end
    end
  end

  def setup_current_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
    true
  end

end
