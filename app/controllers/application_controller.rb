class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  helper_method :get_background
  helper_method :get_members

  protect_from_forgery with: :exception
  
  private
  
  def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def get_background(group_id)
    if group_id != 0
      photos=[]
      galleries = Gallery.where(group_id: group_id).to_a
      galleries.each do |gallery|
        cur_gallery_photos = Photo.where(gallery_id: gallery.id).to_a
        cur_gallery_photos.each do |photo|
          photos << photo.image_url(:background)
        end
      end
      @get_background = photos.sample
      if @get_background.blank?
        @get_background = "/assets/friends.jpg"
      else
        @get_background
      end
    else
      @get_background = "assets/friends.jpg"
    end
  end

  def get_members(group_id)
    members = ''
    users = GroupsAndUsers.where(group_id: group_id).to_a
    users.each do |user|
      members << '<h4>' << User.find_by(id: user.user_id).name << '</h4>'
    end
    @get_members = members
  end
end
