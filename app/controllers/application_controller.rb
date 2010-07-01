# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  before_filter :login_required
  
  private
  
    def login_required 
      unless logged_in?
        session[:return_to] = request.request_uri 
        redirect_to new_session_url 
        return false
      end
      @current_user = User.find(session[:user_id])
    end
    
    def logged_in? 
      !session[:user_id].blank?
    end
    
end
