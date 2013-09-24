module ApplicationHelper
  private
  
  def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
  
  def get_all_groups
    usergroups = GroupsAndUsers.where(user_id: session[:user_id]).to_a
    @groups = []
    if !usergroups.empty?
      usergroups.each do |group|
        @groups << Group.find_by_id(group.group_id)
      end
      @groups
    else
      nil
    end
  end
end
