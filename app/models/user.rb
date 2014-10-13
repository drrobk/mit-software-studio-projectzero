# Schema: User(name:string, password_digest:string)
class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_secure_password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email
end
