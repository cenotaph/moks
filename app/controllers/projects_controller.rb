class ProjectsController < InheritedResources::Base
  actions :index, :show

  def index
    @projects = Project.active.order('created_at desc')
  end
  
  def show
    @project = Project.friendly.find(params[:id])
  end
  
  protected
    def collection
      @projects ||= end_of_association_chain.paginate(:page => params[:page])
    end

end