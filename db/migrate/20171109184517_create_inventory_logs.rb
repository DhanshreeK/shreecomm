class CreateInventoryLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :inventory_logs do |t|
      t.references :inventory_type
      t.string :transfer_id

      t.timestamps
    end
  end
end
