class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :annonymous_id
      t.string :action

      t.timestamps
    end
    add_index :events, :annonymous_id
  end
end
