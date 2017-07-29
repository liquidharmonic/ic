class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, limit: 255
      t.string :last_name, limit: 255
      t.string :email
      t.string :phone_number, limit: 8
      t.string :zip_code, limit: 6
      t.boolean :over_21, default: false
      t.boolean :access_car, default: false

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :phone_number
    add_index :users, :zip_code
  end
end
