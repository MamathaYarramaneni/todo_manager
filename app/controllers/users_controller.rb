class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    render plain: User.all.map { |user| user.display_user }.join("\n")
  end

  def show
    render plain: "User found: #{User.find(params[:id]).display_user}"
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password_digest]
    new_user = User.new(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password: password,
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to todos_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def login
    email = params[:email]
    password = params[:password]
    if User.where(email: email, password: password).exists?
      render plain: true
    else
      render plain: false
    end
  end

  def new
    render "users/new"
  end
end
