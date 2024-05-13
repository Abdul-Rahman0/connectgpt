class Event < ApplicationRecord
  validates :title, presence: true
  has_many :event_participations, dependent: :destroy
  belongs_to :user
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "description", "id", "location", "title", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["event_participations", "user"]
  end
end
