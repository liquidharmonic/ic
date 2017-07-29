class CreateAnnonymousUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :annonymous_users do |t|
      t.string :key
      t.integer :user_id

      t.timestamps
    end
    add_index :annonymous_users, :key
    add_index :annonymous_users, :user_id
  end
end
