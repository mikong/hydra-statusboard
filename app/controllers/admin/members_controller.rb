class Admin::MembersController < AdminController

  def index
    @members = Member.order(:name).page params[:page]
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to [:admin, @member]
    else
      render 'new'
    end
  end

  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to [:admin, @member]
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    redirect_to admin_members_path
  end

private
  def member_params
    params[:member][:project_ids] ||= []
    params.require(:member).permit(:name, :initials, :group_id, project_ids: [])
  end

end
