class EventParticipation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "event_id", "id", "updated_at", "user_id"]
  end
end
