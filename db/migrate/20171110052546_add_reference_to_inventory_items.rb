class AddReferenceToInventoryItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventory_items, :inventory_type
  end
end
