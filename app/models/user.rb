class User < ActiveRecord::Base
  has_many :hosts
  has_many :hats, through: :hosts

   has_secure_password

   def user
   end

end
