class Admin::PagesController < Admin::BaseController

  def index
    @page = Page.filter(:params => params, :filter => :page_filter)
  end
  
  def create
    create! { admin_pages_path }
  end

  def update
    update! { admin_pages_path }
  end

  def destroy
    destroy! { admin_pages_path }
  end
end
