class Book < ActiveRecord::Base
	belongs_to :user

	validates :title, uniqueness: true
    validates :author, presence: true
end