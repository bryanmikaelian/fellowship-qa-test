class SessionsController < ApplicationController
  
  skip_before_filter :login_required
  
  def create 
    if user = User.authenticate(params[:username], params[:password])
      flash[:notice] = nil # remove this for some  wacky notice message errors!!!!
      session[:user_id] = user.id
      cookies[:username] = { :value => user.username, :expires => 1.week.from_now }
      redirect_to blogs_url || blogs_url
    else
      flash[:notice] = "Invalid username and/or password.  Please try again."
      render :action => 'new'
    end 
  end
  
  def destroy
    session.reset!
  end
  
end
