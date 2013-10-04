class Gallery < ActiveRecord::Base
  belongs_to :group
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
end
