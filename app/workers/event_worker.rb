class EventWorker
  include Sidekiq::Worker

  def perform(annonymous_user_id, action)
    Event.create!(annonymous_user_id: annonymous_user_id, action: action)
  end
end
