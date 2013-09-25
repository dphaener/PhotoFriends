class GroupsandusersController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  
  def new
    @group = Group.new
  end
  
  def create
    newgroup = Group.authenticate(group_params[:name], group_params[:password])
    
    if newgroup
      @newgroup = GroupsAndUsers.new(group_id: newgroup.id, user_id: @user.id)
      if @newgroup.save
        redirect_to user_group_path(@user.id, newgroup.id), notice: 'Group was successfully created.'
      end
    else
      flash.now.alert = "Incorrect name/password combination"
      @group = Group.new
      render "new"
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.

    def set_user
      @user = User.find(params[:user_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:owner, :name, :password, :password_confirmation, :user_id)
    end
end
