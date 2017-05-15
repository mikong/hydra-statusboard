class Member < ApplicationRecord
  validates :name, :initials, presence: true
end
