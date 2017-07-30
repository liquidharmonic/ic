class ApplicationController < ActionController::Base
  include AnnonymousUserConcern

  protect_from_forgery with: :exception

  def show
    EventWorker.perform_async(annonymous_user_id, 'Onboarding - 1 homepage')
  end

  def apply
    EventWorker.perform_async(annonymous_user_id, 'Onboarding - 2 apply')
  end

  def background_check
    # TODO update user's background_check column
    EventWorker.perform_async(annonymous_user_id, 'Onboarding - 3 ask for background check')
  end

  def done
    EventWorker.perform_async(annonymous_user_id, 'Onboarding - 4 signed up')
  end

end
