class Announcement < ApplicationRecord
  validates :body, :emoji, presence: true

  after_initialize :set_default_emoji

  DEFAULT_EMOJI = ':octopus:'

private
  def set_default_emoji
    self.emoji ||= DEFAULT_EMOJI
  end

end
