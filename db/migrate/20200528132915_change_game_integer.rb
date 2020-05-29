class ChangeGameInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :games, :surve_a, :integer
    change_column :games, :surve_b, :integer
    change_column :games, :score_a, :integer
    change_column :games, :score_b, :integer

    change_column :members, :win, :integer
    change_column :members, :lose, :integer
  end
end
