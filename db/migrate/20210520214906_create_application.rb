class CreateApplication < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :applicant_qualitys
      t.string :pet_names
      t.string :application_status

      t.timestamps
    end
  end
end
