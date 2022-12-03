class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!

    if @user.save
      # If user saves in the db successfully:
      flash[:success] = 'Account created successfully!'
      redirect_to login_path
    else
      # If user fails model validation - probably a bad password or duplicate email:
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
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
