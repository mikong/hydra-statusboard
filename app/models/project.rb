class Project < ApplicationRecord
  validates :name, presence: true

  has_many :assignments
  has_many :members, through: :assignments
end
