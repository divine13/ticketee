class Ticket < ActiveRecord::Base

	validates(:title, presence: true)
	validates(:description, presence: true, length: { minimum: 5 })

    belongs_to(:project)
    belongs_to(:user)

    has_attached_file :asset
    has_many :assets

    accepts_nested_attributes_for :assets

    has_many :comments
end
