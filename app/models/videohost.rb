class Videohost < ActiveRecord::Base
 # attr_accessible :name
  has_many :videos
end
