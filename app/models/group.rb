class Group < ApplicationRecord
  validates :name, presence: true
  validates :color, format: {
    with: /\A([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/,
    message: 'is not a valid color hex' }
end
