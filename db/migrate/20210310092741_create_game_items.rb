class CreateGameItems < ActiveRecord::Migration[5.2]
  def change
    create_table  :game_items do |t|
      t.string :title
      t.string :genre
      t.string :url
      t.string :rating
      t.integer :user_id
      t.timestamps null: false
   end
 end
end