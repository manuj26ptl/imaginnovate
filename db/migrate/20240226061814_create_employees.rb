class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.integer :employee_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :salary
      t.date :date_of_joining

      t.timestamps
    end
  end
end
