class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         #this is called from the admin/users/index.html every time the the second link_to method is called
         #it out puts the email first and your status of being an admin
         def to_s
         	#  .print email   .if admin put admin
         	"#{email} (#{admin? ? "Admin" : "User"})" 
         end
end
