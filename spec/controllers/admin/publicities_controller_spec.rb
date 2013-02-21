require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::PublicitiesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Publicity.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Publicity.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Publicity.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_publicity_url(assigns[:publicity]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Publicity.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Publicity.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Publicity.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Publicity.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Publicity.first
    response.should redirect_to(admin_publicity_url(assigns[:publicity]))
  end

  it "destroy action should destroy model and redirect to index action" do
    publicity = Publicity.first
    delete :destroy, :id => publicity
    response.should redirect_to(admin_publicities_url)
    Publicity.exists?(publicity.id).should be_false
  end
end
