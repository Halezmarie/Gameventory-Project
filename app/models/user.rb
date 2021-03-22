class User < ActiveRecord::Base
  
  #checks it to make sure it's the correct password
  has_secure_password


  has_many :game_items
  #instances saved by how many game items



  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true
end

