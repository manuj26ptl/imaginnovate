class ChangeSalaryToFloat < ActiveRecord::Migration[7.0]
  def change
    change_column(:employees, :salary, :float)
  end
end
