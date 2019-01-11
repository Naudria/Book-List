class Book < ActiveRecord::Base
	belongs_to :user
	belongs_to :genre

	validates :title, uniqueness: true
    validates :author, presence: true
end