# here is where we will create some see date to work with and test associations

#create  user

require "faker"

20.times do 
    User.create(game: Faker::Title.name)
end