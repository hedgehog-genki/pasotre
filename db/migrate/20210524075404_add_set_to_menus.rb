class AddSetToMenus < ActiveRecord::Migration[6.0]
  def change
    add_column :menus, :set, :string
  end
end
