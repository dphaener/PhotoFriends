class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  def index
  end
  
  # GET /groups/1
  # GET /groups/1.json
  def show
    @gallery = Gallery.where(group_id: @group.id).to_a
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        @groupsandusers = GroupsAndUsers.new(group_id: @group.id, user_id: @user.id)
          if @groupsandusers.save
            format.html { redirect_to user_group_path(@user, @group), notice: 'Group was successfully created.' }
            format.json { render action: 'show', status: :created, location: @group }
          else
            format.html { render action: 'new' }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  # PATCH/PUT /groups/1
  # PATCH/PUT /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to user_group_path(@user, @group), notice: 'Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    GroupsAndUsers.destroy_all(group_id: @group.id)
    @group.destroy
    set_last_group
    redirect_to user_group_path(@user, @group)
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
      params.require(:group).permit(:owner, :name, :password, :password_confirmation, :user_id)
    end

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
