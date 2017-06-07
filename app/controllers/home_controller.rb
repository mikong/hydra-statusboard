class HomeController < ApplicationController
  def index
    @date = Time.now.strftime("%A, %B %d, %Y")
    @time = Time.now.strftime("%-I:%M %p")
    @projects = Project.all
    @announcements = Announcement.all
  end
end
