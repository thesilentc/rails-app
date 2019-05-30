class Hat < ActiveRecord::Base

  has_many :hosts
  has_many :users, through: :hosts
end
