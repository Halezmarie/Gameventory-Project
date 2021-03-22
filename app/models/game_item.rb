class GameItem < ActiveRecord::Base
  belongs_to :user

  #all instances are going to be saved this way, to user who it belongs to 
end
