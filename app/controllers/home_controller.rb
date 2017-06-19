class HomeController < ApplicationController
  def index
    @date = Time.now.strftime("%A, %B %d, %Y")
    @time = Time.now.strftime("%-I:%M %p")
    @projects = Project.with_members_or_with_groups.order(:name)
    @announcements = Announcement.all
  end
end
