class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :annonymous_key
      t.string :action

      t.timestamps
    end
    add_index :events, :annonymous_key
  end
end
