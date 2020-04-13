class User < ApplicationRecord
  has_many :todos

  def display_user
    "#{id}. Name: #{name} , Email: #{email} "
  end
end
