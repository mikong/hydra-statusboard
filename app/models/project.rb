class Project < ApplicationRecord
  validates :name, presence: true

  has_many :assignments, dependent: :destroy
  has_many :members, through: :assignments
  has_many :group_assignments, dependent: :destroy
  has_many :groups, through: :group_assignments

  scope :with_members, -> { joins(:members).distinct }
  scope :with_groups, -> { joins(:groups).distinct }

  def self.with_members_or_with_groups
    Project.from("(#{with_members.to_sql} UNION #{with_groups.to_sql}) AS projects")
  end

end
