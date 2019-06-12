class Host < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :user
  has_many :hats

  scope :status, -> { where(status: 'active') }
  scope :recent, -> { order('projects.updated_at DESC') }
  
  def completed?
    !completed_at.blank?
  end 

end

# might try to rework the db this way
# class Host < ActiveRecord::Base

#   has_many :hats
#   has_many :users, through: :hats
# end
