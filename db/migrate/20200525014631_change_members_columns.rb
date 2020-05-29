class ChangeMembersColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :name, :string
    add_column :members, :win, :string
    remove_column :members, :content, :string
  end
end
