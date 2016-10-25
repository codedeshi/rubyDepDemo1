class Group < ActiveRecord::Base
	belongs_to :user
	has_many :meberships, dependent: :destroy

	validates :name, :description, presence: true
	validates :name, length: { minimum: 5 }
	validates :description, length: { minimum: 10 }
	
end
