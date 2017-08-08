class RemoveEndFromEvent < ActiveRecord::Migration[5.1]
  def change
	  remove_column :events, :end, :datetime
  end
end
