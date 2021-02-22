class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 6..64

         has_many :posts 
         # Inidicates that the user model has a has_many association with the posts model
  validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 100}
end
