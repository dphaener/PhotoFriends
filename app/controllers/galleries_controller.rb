class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]
  before_action :set_group, :set_user
  
  # GET /galleries
  # GET /galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /galleries/1
  # GET /galleries/1.json
  def show
    @photos = Photo.where(gallery_id: @gallery.id).order("created_at ASC").to_a
    @comments = Comment.where(gallery_id: @gallery.id).to_a
    @comment = Comment.new
  end

  # GET /galleries/new
  def new
    @gallery = @group.galleries.new
  end

  # GET /galleries/1/edit
  def edit
  end

  # POST /galleries
  # POST /galleries.json
  def create
    @gallery = @group.galleries.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to user_group_path(@user, @group) }
        format.json { render action: 'show', status: :created, location: @gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /galleries/1
  # PATCH/PUT /galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to user_group_gallery_path(@user, @group, @gallery) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /galleries/1
  # DELETE /galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to user_group_galleries_path(@user, @group) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end
    
    def set_group
      @group = Group.find(params[:group_id])
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:name, :archive, :group_id)
    end
end
