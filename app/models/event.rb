class Event < ApplicationRecord
  has_many :event_participations, dependent: :destroy
  belongs_to :user
end
