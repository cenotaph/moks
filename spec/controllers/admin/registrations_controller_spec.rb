require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::RegistrationsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Registration.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Registration.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Registration.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_registration_url(assigns[:registration]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Registration.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Registration.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Registration.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Registration.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Registration.first
    response.should redirect_to(admin_registration_url(assigns[:registration]))
  end

  it "destroy action should destroy model and redirect to index action" do
    registration = Registration.first
    delete :destroy, :id => registration
    response.should redirect_to(admin_registrations_url)
    Registration.exists?(registration.id).should be_false
  end
end
