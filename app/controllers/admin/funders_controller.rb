class Admin::FundersController < Admin::BaseController

  def create
    create! { admin_funders_path }
  end

  def update
    update! { admin_funders_path }
  end

  def destroy
    destroy! { admin_funders_path }
  end
  
end
