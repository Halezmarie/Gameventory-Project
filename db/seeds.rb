# here is where we will create some see date to work with and test associations

#create  users

    icarus= User.create(name: "Icarus", email: "icarus@icarus.com", password: "password")
    anastasia= User.create(name: "Anastasia", email: "anastasia@anastasia.com", password: "password")

GameItem.create(title: "Mortal Kombat PS1", genre: "Fighting", url: "https://happymag.tv/wp-content/uploads/2020/03/mortal-kombat-2.jpg", rating: "M", user_id: icarus.id)

GameItem.create(title: "Final Fantasy 7 PS1", genre: "Role-Playing", url: "https://upload.wikimedia.org/wikipedia/en/c/c2/Final_Fantasy_VII_Box_Art.jpg", rating: "T", user_id: anastasia.id)

