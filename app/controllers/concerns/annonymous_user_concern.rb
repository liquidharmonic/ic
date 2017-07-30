module AnnonymousUserConcern
  def annonymous_user_id
    @annonymous_user_id ||= annonymous_user_id_cookie
  end

  def annonymous_user_id_cookie
    if cookies[:annonymous_id].nil?
      cookies[:annonymous_id] = srand
    end
    cookies[:annonymous_id]
  end


end
