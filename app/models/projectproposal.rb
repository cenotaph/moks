class Projectproposal < ActiveRecord::Base
  attr_accessible :name, :organisation, :email, :address, :country_of_origin, :country_of_residence, :phone_number, :short_description, :duration, :long_description, :public_engagement, :materials, :spatial_requirements, :cost, :bio, :urls, :moks_goodfit, :attachment, :archived, :project_id
end
