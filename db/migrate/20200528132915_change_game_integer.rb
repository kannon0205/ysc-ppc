class ChangeGameInteger < ActiveRecord::Migration[6.0]
  def up
    remove_column :games, :surve_a, :string
    remove_column :games, :surve_b, :string
    remove_column :games, :score_a, :string
    remove_column :games, :score_b, :string

    remove_column :members, :win, :string
    remove_column :members, :lose, :string

    add_column :games, :surve_a, :integer
    add_column :games, :surve_b, :integer
    add_column :games, :score_a, :integer
    add_column :games, :score_b, :integer

    add_column :members, :win, :integer
    add_column :members, :lose, :integer
  end
end
