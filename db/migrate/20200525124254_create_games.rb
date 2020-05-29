class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :player_a
      t.string :player_b
      t.string :surve_a
      t.string :surve_b
      t.string :score_a
      t.string :score_b

      t.timestamps
    end
  end
end
