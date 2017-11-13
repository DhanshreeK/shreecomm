class CreateTransfers < ActiveRecord::Migration[5.1]
  def change
    create_table :transfers do |t|
      t.string :transfer_item
      t.string :remark
      t.references :inventory_type

      t.timestamps
    end
  end
end
