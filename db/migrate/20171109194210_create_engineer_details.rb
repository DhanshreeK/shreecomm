class CreateEngineerDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :engineer_details do |t|
      t.string :bill_no
      t.string :custome_name
      t.date :date
      t.string :address
      t.string :customer_no
      t.string :telephone_no
      t.string :mobile_no
      t.string :mobile_modal_name
      t.date :purchase_date
      t.string :serial_no
      t.string :full_warranty
      t.string :labor_only
      t.string :parts_only
      t.string :out_of_warranty
      t.string :repair_received
      t.string :repair_completed
      t.date :return_by_date
      t.string :defect_description
      t.string :b2b_svc
      t.string :accessory
      t.string :repair_description
      t.string :condition_code
      t.string :symtom_code
      t.string :defect_code
      t.string :repair_code
      t.string :testing_cost
      t.string :repair_cost
      t.string :software_testing_cost
      t.string :imei1
      t.string :imei2
      t.string :advanced_paid
      t.string :status
      t.string :estimated_cost
      t.string :balance_cost
      t.string :grand_total
      t.references :employee

      t.timestamps
    end
  end
end
