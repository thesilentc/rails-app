class Hat < ActiveRecord::Base

  belongs_to :host
  has_many :users, through: :hosts
end

# might try to rework the db this way

# class Hat < ApplicationRecord

#   has_many :hosts
#   has_many :users, through: :hosts
# end
