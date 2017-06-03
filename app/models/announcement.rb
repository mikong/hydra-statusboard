class Announcement < ApplicationRecord
  validates :body, presence: true
end
