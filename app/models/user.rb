# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	has_many :posts

	before_save { self.email = email.downcase }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
	validates :email, presence: true, 
				format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false } 
	validates :name, presence: true, length: { maximum: 50 } 

	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable
	include DeviseTokenAuth::Concerns::User
end
