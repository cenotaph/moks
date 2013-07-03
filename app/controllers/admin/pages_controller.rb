class Admin::PagesController < Admin::BaseController
  prepend_before_filter :find_page, :only => [:show, :edit, :update, :destroy]
  actions :from_slug, :index, :create, :update, :destroy, :edit


  
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

  private

  def find_page
    @page = Page.friendly.find(params[:id])
  end

  protected
    
  def permitted_params
    params.permit(:page => [ :slug, 
      translations_attributes: [:id, :locale, :title, :body, :abstract]
      ])
  end
end
