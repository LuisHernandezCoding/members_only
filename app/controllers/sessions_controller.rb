class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to user_path(current_user), notice: 'You are already logged in.'
    else
      render :new, locals: { login: {} }
    end
  end

  def create
    if current_user
      redirect_to user_path(current_user), notice: 'You are already logged in.'
    else
      user = User.find_by(email: params[:login][:email].downcase)

      if user&.authenticate(params[:login][:password])
        session[:user_id] = user.id
        flash[:success] = 'Logged in!'
        redirect_to user_path(user)
      else
        flash.now[:error] = 'Incorrect email or password, try again.'
        render :new, status: :unauthorized, locals: { login: params[:login] }
      end
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:alert] = 'Logged out!'
    redirect_to login_path
  end
end
