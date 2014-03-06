class User < ActiveRecord::Base
  VALID_EMAIL_REGX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:name, presence: true, length: {maximum:50})
  validates(:email, presence: true, format: {with: VALID_EMAIL_REGX}, uniqueness: { case_sensitive: false })
  validates(:password, length: { minimum: 6 })
  
  before_save { self.email = email.downcase }
  
  has_secure_password
end
