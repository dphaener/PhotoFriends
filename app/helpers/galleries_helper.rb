module GalleriesHelper
  def get_user(user_id)
    @get_user = User.find_by(id: user_id)
  end
end
