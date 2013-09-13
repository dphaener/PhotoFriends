class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_hash
      t.string :password_salt
      t.string :avatar
      t.integer :userlevel
      t.references :group, index: true

      t.timestamps
    end
  end
end
