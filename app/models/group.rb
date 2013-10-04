class Group < ActiveRecord::Base
  has_many :groups_and_users
  has_many :users, through: :groups_and_users
  has_many :galleries, dependent: :destroy


  
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.authenticate(name, password)
    group = find_by_name(name)
    if group && group.password_hash == BCrypt::Engine.hash_secret(password, group.password_salt)
      group
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
