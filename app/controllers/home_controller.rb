class HomeController < ApplicationController
  def index
    @datetime = Time.now.strftime("%-I:%M %p %A, %B %d, %Y")
  end
end
