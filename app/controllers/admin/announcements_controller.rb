class Admin::AnnouncementsController < AdminController

  def index
    @announcements = Announcement.order(:updated_at).page params[:page]
  end

  def show
    @announcement = Announcement.find(params[:id])
  end

  def new
    @announcement = Announcement.new
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def create
    @announcement = Announcement.new(announcement_params)

    if @announcement.save
      redirect_to [:admin, @announcement]
    else
      render 'new'
    end
  end

  def update
    @announcement = Announcement.find(params[:id])

    if @announcement.update(announcement_params)
      redirect_to [:admin, @announcement]
    else
      render 'edit'
    end
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy

    redirect_to admin_announcements_path
  end

private

  def announcement_params
    params.require(:announcement).permit(:body, :emoji)
  end
end
