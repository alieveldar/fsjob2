class ChangeTableUser < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.rename :full_name, :username
    end
  end
end
