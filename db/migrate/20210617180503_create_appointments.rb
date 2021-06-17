class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :patient_name
      t.string :doctor_name
      t.text :medical_history

      t.timestamps
    end
  end
end
