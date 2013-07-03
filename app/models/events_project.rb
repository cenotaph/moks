class EventsProject < ActiveRecord::Base
  # attr_accessible :event_id, :project_id
  belongs_to :event
  belongs_to :project
end