class EventsController < InheritedResources::Base
  actions :index, :show

  def current_exhibition
    @event = Project.friendly.find('exhibition').events.where(["DATE(?) BETWEEN start_at AND end_at", Time.now.to_date]).order("start_at").first
    @title = t(:current_exhibition)
    render :template => 'events/show'
  end
  
  def index
    @events = Event.published.order('start_at desc')
  end
  
  def show
    @event = Event.friendly.find(params[:id])
  end
  
  protected
    def collection
      @events ||= end_of_association_chain.paginate(:page => params[:page])
    end

end