class Admin::InvoicesController < Admin::BaseController
   def index
    @invoice = Invoice.filter(:params => params, :filter => :invoice_filter)
  end
  
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

end
