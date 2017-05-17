class Member < ApplicationRecord
  validates :name, :initials, presence: true

  has_many :assignments
  has_many :projects, through: :assignments
end
