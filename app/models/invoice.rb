class Invoice < ActiveRecord::Base
  # attr_accessible :contact_id, :date_issued, :date_due, :number, :amount, :attachment, :what_for
  belongs_to :contact
  has_many :incomes
  mount_uploader :attachment, DocumentUploader
  validates_presence_of :contact_id, :date_issued, :date_due, :amount, :what_for

  before_save :check_paid

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
  
  scope :unpaid, where('paid != 1')

end
