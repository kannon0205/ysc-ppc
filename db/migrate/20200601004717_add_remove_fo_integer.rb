class AddRemoveFoInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :surve_a, :integer
    remove_column :games, :surve_b, :integer
    remove_column :games, :score_a, :integer
    remove_column :games, :score_b, :integer

    remove_column :members, :win, :integer
    remove_column :members, :lose, :integer
  end
end
