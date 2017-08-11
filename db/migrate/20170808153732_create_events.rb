class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.text :description
      t.string :repeat
      t.integer :user_id

      t.timestamps
    end
  end
end
