class CreateUserEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :user_employees do |t|
      t.references :user
      t.references :employee

      t.timestamps
    end
  end
end
