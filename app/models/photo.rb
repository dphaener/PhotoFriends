class Photo < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user

  mount_uploader :image, ImageUploader
end
