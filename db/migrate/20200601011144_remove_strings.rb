class RemoveStrings < ActiveRecord::Migration[6.0]
  def change
    remove_column :games, :surve_a, :string
    remove_column :games, :surve_b, :string
    remove_column :games, :score_a, :string
    remove_column :games, :score_b, :string

    remove_column :members, :win, :string
    remove_column :members, :lose, :string
  end
end
