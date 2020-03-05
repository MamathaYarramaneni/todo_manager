class UsersController < ApplicationController
  def index
    render plain: User.all.map { |user| user.display_user }.join("\n")
  end
end
