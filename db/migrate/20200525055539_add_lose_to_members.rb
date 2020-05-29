class AddLoseToMembers < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :lose, :string
  end
end
