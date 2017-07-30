class Event < ApplicationRecord
  validates :annonymous_user, presence: true
  validates :action, presence: true
end
