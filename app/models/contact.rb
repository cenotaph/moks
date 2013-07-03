class Contact < ActiveRecord::Base
  # attr_accessible :contact_person, :organisation, :address1, :address2, :city, :county, :postcode, :country, :phone, :website, :email
  has_many :invoices
  validates_presence_of :contact_person, :email

  def name_or_organisation
    organisation.blank? ? contact_person : "#{organisation} [#{contact_person}]"
  end
end
