class Project < ApplicationRecord
  validates :name, presence: true

  has_many :assignments, dependent: :destroy
  has_many :members, through: :assignments
end
