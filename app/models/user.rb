class User < ActiveRecord::Base
  has_many :groups_and_users
  has_many :groups, through: :groups_and_users
  
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
  
  def self.authenticate(credential_name, password)
    user = find_by_email(credential_name)
    if !user
			user = find_by_username(credential_name)
		end
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      self.userlevel = 5
    end
  end
end
