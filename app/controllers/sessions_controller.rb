class SessionsController < ApplicationController
  
  def new
    if session[:user_id]
      set_last_group
      if @group != nil
        redirect_to user_group_path(session[:user_id], @group) 
      else
        redirect_to user_groups_path(session[:user_id])
      end
    end
	end
	
	def create
	  user = User.authenticate(params[:session][:credential_name], params[:session][:password])
	  if user
	    session[:user_id] = user.id
      set_last_group
      if @group != nil
        redirect_to user_group_path(user.id, @group) 
	    else
        redirect_to user_groups_path(session[:user_id])
      end
	  else
      flash.now.alert = "Invalid email or password"
	    render "new"
	  end
	end
	
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url
	end
  
  private
  
  # TODO: Possibly refactor to handle all this mess with a single query......
  def set_last_group
    if session[:user_id]
      # user = User.find(session[:user_id])
      # @group = user.groups.order(:updated_at).first
      usergroups = GroupsAndUsers.where(user_id: session[:user_id]).to_a
      groups = []
      if !usergroups.empty?
        usergroups.each do |group|
          groups << Group.find_by(id: group.group_id)
        end
        sorted = groups.sort {|g,h| h[:updated_at] <=> g[:updated_at]}
        @group = Group.find_by(id: sorted[0].id)
      else
        nil
      end
    else
      nil
    end
  end
end
