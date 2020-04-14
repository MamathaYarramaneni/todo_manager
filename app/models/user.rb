class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 4 }
  validates :email, presence: true
  has_secure_password
  has_many :todos

  def display_user
    "#{id}. Name: #{name} , Email: #{email} "
  end
end
