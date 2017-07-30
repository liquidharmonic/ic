class Event < ApplicationRecord
  validates :annonymous_key, presence: true
  validates :action, presence: true

  def annonymous_user
    @annonymous_user ||= AnnonymousUser.where(key: annonymous_key).first
  end

  def user
    @user ||= annonymous_user.try(:user)
  end
end
