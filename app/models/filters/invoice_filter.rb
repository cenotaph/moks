class InvoiceFilter < WillFilter::Filter
  def model_class
    Invoice
  end
end