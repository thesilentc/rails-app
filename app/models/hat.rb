class Hat < ActiveRecord::Base

  belongs_to :host
  has_many :users, through: :hosts
end
