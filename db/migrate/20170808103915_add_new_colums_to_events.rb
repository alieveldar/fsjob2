class AddNewColumsToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :description, :text
    add_column :events, :repeat, :string
    add_column :events, :user_id, :integer
  end
end
