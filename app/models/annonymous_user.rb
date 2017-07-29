class AnnonymousUser < ApplicationRecord
  validates :user, presence: true
end
