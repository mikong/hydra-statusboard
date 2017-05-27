class Member < ApplicationRecord
  validates :name, :initials, presence: true

  has_many :assignments, dependent: :destroy
  has_many :projects, through: :assignments
  belongs_to :group, optional: true
end
