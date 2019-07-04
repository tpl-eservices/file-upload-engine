class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable, :confirmable
	has_many :uploads
	has_one_attached :avatar
	validates_uniqueness_of :username
	validates :email,
		format: { 
			with: /\b[A-Z0-9._%a-z\-]+(@tpl|@torontopubliclibrary)\.ca\z/,
        	message: "You can only sign up with a tpl.ca (or torontopubliclibrary.ca) account" 
        }
end
