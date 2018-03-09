class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false,  unique: true
      t.string :password_digest, null:false
      t.string :session_token, null: false, unique: true
    end

    add_index :users, :session_token, unique: true
    add_index :users, :email, unique: true 
  end
end
