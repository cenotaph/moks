class Residencyapplication < ActiveRecord::Base
  attr_accessible :name, :organisation, :email, :address1, :address2, :city, :county, :postcode, :country_of_residence, :country_of_origin, :gender, :contact_phone, :field_of_interest, :urls, :languages_spoken, :cv, :other_attachment, :preferred_dates, :funny_question, :other_questions, :how_did_hear, :reason, :residencytype_id
end
