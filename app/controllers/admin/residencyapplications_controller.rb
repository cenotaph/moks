class Admin::ResidencyapplicationsController < Admin::BaseController

  def create
    create! { admin_residencyapplications_path }
  end

  def update
    update! { admin_residencyapplications_path }
  end

  def destroy
    destroy! { admin_residencyapplications_path }
  end

end