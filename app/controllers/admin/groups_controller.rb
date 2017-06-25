class Admin::GroupsController < AdminController

  def index
    @groups = Group.order(:name).page params[:page]
  end

  def show
    @group = Group.find(params[:id])
    @members = @group.members
    @projects = @group.projects
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to [:admin, @group]
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to [:admin, @group]
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to admin_groups_path
  end

private

  def group_params
    params[:group][:member_ids] ||= []
    params[:group][:project_ids] ||= []
    params.require(:group).permit(:name, :color, :initials, member_ids: [], project_ids: [])
  end
end
