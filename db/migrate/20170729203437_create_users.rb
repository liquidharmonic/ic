class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.string :email
      t.string :phone_number, limit: 8
      t.string :zip_code, limit: 6
      t.bool :over_21
      t.bool :access_car

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :phone_number
    add_index :users, :zip_code
  end
end
