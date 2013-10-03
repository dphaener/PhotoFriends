class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_group

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new 
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
	  if @user.save
			user_log = User.authenticate(user_params[:email], user_params[:password])
			if user_log
				session[:user_id] = user_log.id
			end
	    redirect_to user_groups_path(@user.id)
	  else
	    render "new"
	  end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_group_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def set_group
      @group = GroupsAndUsers.where(user_id: params[:id]).take
      if @group.blank?
        @group = GroupsAndUsers.new group_id: 0
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar, :userlevel, :id, :name)
    end
end
