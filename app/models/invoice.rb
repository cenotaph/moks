class Invoice < ActiveRecord::Base

  belongs_to :contact
  has_many :incomes
  mount_uploader :attachment, DocumentUploader
  validates_presence_of :contact_id, :date_issued, :date_due, :amount, :what_for

  before_save :check_paid

  scope :unpaid, -> { where(paid: false)} 
  
  def check_paid
    if !incomes.empty?
      if incomes.map{|x| x.amount}.sum >= amount
        paid = true
      end
    end
  end

  def percentage_paid
    (incomes.map{|x| x.amount}.sum / amount) * 100
  end
  


end
