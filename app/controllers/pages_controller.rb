class PagesController < InheritedResources::Base
  def index
    @pages = Page.all
  end

  def show
    begin
      @page = Page.friendly.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render :template => 'pages/404missing'
    end
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end
end
