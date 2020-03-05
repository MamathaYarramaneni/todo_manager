class User < ApplicationRecord
  def display_user
    "#{id}. Name: #{name} , Email: #{email} "
  end
end
