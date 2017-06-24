class Project < ApplicationRecord
  validates :name, :color_indicator, presence: true

  has_many :assignments, dependent: :destroy
  has_many :members, through: :assignments
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments

  scope :with_members, -> { joins(:members).distinct }
  scope :with_groups, -> { joins(:groups).distinct }

  def self.with_members_or_with_groups
    Project.from("(#{with_members.to_sql} UNION #{with_groups.to_sql}) AS projects")
  end

  after_initialize :set_default_color_indicator

  DEFAULT_COLOR_INDICATOR = "#868686"
  TASTELESS_COLOR_INDICATOR = "#CC4478"

private
  def set_default_color_indicator
    self.color_indicator ||= DEFAULT_COLOR_INDICATOR
  end

end
