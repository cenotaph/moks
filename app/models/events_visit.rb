class EventsVisit < ActiveRecord::Base
  #attr_accessible :event_id, :visit_id, :translations_attributes
  belongs_to :event
  belongs_to :visit
  translates :description => :text, :fallbacks_for_empty_translations => true
  accepts_nested_attributes_for :translations , :reject_if => proc {|att| att['description'].blank? }
end