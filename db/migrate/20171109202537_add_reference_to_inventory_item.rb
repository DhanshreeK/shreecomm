class AddReferenceToInventoryItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :inventory_items, :customer_detail, foreign_key: true
  end
end
