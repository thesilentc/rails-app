class Host < ActiveRecord::Base

  has_many :users
  belongs_to :hat
end
