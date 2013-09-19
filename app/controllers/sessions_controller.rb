class SessionsController < ApplicationController
  def new
    redirect_to user_groups_path(session[:user_id]) if session[:user_id]
	end
	
	def create
	  user = User.authenticate(params[:credential_name], params[:password])
	  if user
	    session[:user_id] = user.id
	    redirect_to user_groups_path(user.id), :notice => "Logged in!"
	  else
      flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end
	
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url
	end
  
end
