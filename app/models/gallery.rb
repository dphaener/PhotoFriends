class Gallery < ActiveRecord::Base
  belongs_to :group
  has_many :photos
end
