#THIS IS TO BE DELETED BEFORE SHIPPING

A user has many hosts
A host has many users
Users have many hats through hosts
Hats have many users through hosts


class User < ApplicationRecord
  has_many :hosts
  has_many :hats, through: :hosts
end

class Host < ApplicationRecord
  has_many :users
  has_many :hats
end

class Hat < ApplicationRecord
  has_many :hosts
  has_many :users, through: :hosts
end
