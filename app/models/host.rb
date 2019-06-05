class Host < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :users
  belongs_to :hat

  # scope :status, -> { where(status: 'active') }
  # scope :recent, -> { order('projects.updated_at DESC') }

end
