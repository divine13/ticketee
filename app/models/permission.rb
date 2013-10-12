class Permission < ActiveRecord::Base
	belongs_to :user
	belongs_to :thing, polymorphic: true #power line
end
