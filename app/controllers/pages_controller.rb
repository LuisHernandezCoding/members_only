class PagesController < ApplicationController
  def home
    # if logged in, redirect to user profile page:
    # redirect_to user_path(current_user) if logged_in?
  end

  def about; end
  def contact; end

  private

  def logged_in?
    # if there is a current user, return true:
    # !!current_user
  end
end
