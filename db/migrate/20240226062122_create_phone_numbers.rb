class CreatePhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers do |t|
      t.integer :phone_number

      t.timestamps
    end
  end
end
