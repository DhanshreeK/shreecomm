class AddGstFieldToGeneralSetting < ActiveRecord::Migration[5.1]
  def change
    add_column :general_settings, :gst, :float
    add_column :general_settings, :testing_cost, :string
    add_column :general_settings, :repair_cost, :string
    add_column :general_settings, :software_testing_cost, :string
    add_column :general_settings, :cgst, :string
    add_column :general_settings, :sgst, :string
    add_column :general_settings, :igst, :string
  end
end
