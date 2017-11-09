class AddReferencesToEngineerDetails < ActiveRecord::Migration[5.1]
  def change
    add_reference :engineer_details, :customer_detail, foreign_key: true
  end
end
