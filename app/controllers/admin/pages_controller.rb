class Admin::PagesController < Admin::BaseController

  actions :from_slug, :index, :create, :update, :destroy, :edit

  def index
    @page = Page.filter(:params => params, :filter => :page_filter)
  end
  
  def create
    create! { admin_pages_path }
  end

  def from_slug
    @page = Page.new(:slug => params[:slug])
    render :template => "admin/pages/new"
  end

  def update
    update! { admin_pages_path }
  end

  def destroy
    destroy! { admin_pages_path }
  end
end
