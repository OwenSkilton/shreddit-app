class Post < ApplicationRecord
    belongs_to :user # Indicates the one to many relationship with user 
    validates :title, presence: true
end
