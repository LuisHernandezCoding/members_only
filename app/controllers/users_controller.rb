class UsersController < ApplicationController
  def new
    @user = User.new
    if current_user
      redirect_to user_path(current_user), notice: 'You are already logged in.'
    else
      render :new, locals: { user: {} }
    end
  end

  def create
    @user = User.new(user_params)
    @user.email.downcase!
    if @user.save
      flash[:success] = 'Account created successfully!'
      redirect_to login_path
    else
      flash.now[:error] = "Oops, couldn't create account. Please make sure you are using a valid email and password."
      render :new, status: :unprocessable_entity, locals: { user: @user }
    end
  end

  def show
    @user = User.find(params[:id])
    @funny_titles = ['Lord of the cats', 'Master of the universe', 'King of the world', 'God of the universe',
                     'Master of the cats', 'King of the universe', 'God of the world', 'Lord of the universe',
                     'Master of the world', 'God of the cats', 'King of the cats', 'Lord of the world',
                     'Master of the cats', 'King of the universe', 'God of the universe', 'Lord of the cats',
                     'Master of the world', 'God of the world', 'Lord of the universe']
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
