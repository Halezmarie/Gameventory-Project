class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest #keeps passwords encrypted
      t.timestamps null: false
    end
  end
end