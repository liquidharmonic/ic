class ApplicationController < ActionController::Base
  include AnnonymousUserConcern

  protect_from_forgery with: :exception

  def show
    EventWorker.perform_async(annonymous_user_id: annonymous_user_id, action: 'Onboarding - 1 homepage')
  end

  def apply
    EventWorker.perform_async(annonymous_user_id: annonymous_user_id, action: 'Onboarding - 2 apply')
  end

  def background_check
    EventWorker.perform_async(annonymous_user_id: annonymous_user_id, action: 'Onboarding - 3 ask for background check')
  end

  def done
    EventWorker.perform_async(annonymous_user_id: annonymous_user_id, action: 'Onboarding - 4 signed up')
  end

end
