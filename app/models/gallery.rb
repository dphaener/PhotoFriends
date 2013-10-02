class Gallery < ActiveRecord::Base
  belongs_to :group
  has_many :photos
  has_many :comments
end
