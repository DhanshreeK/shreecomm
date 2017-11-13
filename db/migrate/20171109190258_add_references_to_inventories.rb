class AddReferencesToInventories < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventories, :transfer
  end
end
