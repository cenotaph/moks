class Admin::InvoicesController < Admin::BaseController

  def create
    create! { admin_invoices_path }
  end

  def update
    update! { admin_invoices_path }
  end

  def destroy
    destroy! { admin_invoices_path }
  end

  def show
    @invoice = Invoice.find(params[:id])
    respond_to do |format|  
      format.html
      format.pdf do
        render :pdf => "file_name"
      end
    end
  end

  protected

  def permitted_params
    params.permit(:invoice => [ :contact_id, :date_issued, :date_due, :number, 
                                :amount, :attachment, :what_for])
  end

end
