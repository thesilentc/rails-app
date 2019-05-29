class Host < ActiveRecord::Base

  has_many :hats
  has_many :users
end
