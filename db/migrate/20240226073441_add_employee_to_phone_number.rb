class AddEmployeeToPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    add_reference :phone_numbers, :employee, foreign_key: true
  end
end
