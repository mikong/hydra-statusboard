class Group < ApplicationRecord
  validates :name, presence: true
  validates :color, format: {
    with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/,
    message: 'is not a valid color hex' }

  has_many :group_assignments, dependent: :destroy
  has_many :projects, through: :group_assignments
  has_many :members
end
