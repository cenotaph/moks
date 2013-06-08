class EventsController < InheritedResources::Base
  actions :index, :show

  def index
    @events = Event.published.order('start_at desc')
  end
  
  protected
    def collection
      @events ||= end_of_association_chain.paginate(:page => params[:page])
    end

end