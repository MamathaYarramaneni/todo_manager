class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map { |user| user.display_user }.join("\n")
  end

  def show
    render plain: "User found: #{User.find(params[:id]).display_user}"
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    display_text = "New user added with id: #{new_user.id} with name: #{new_user.name}"
    render plain: display_text
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
end
