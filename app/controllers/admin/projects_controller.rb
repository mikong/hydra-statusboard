class Admin::ProjectsController < AdminController

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @members = @project.members
    @groups = @project.groups
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to [:admin, @project]
    else
      render 'new'
    end
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to [:admin, @project]
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to admin_projects_path
  end

private
  def project_params
    params[:project][:member_ids] ||= []
    params[:project][:group_ids] ||= []
    params.require(:project).permit(:name, :status, member_ids: [], group_ids: [])
  end

end
