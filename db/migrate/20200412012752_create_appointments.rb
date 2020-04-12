class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.time :appointment_time
      t.string :communication_medium
      t.integer :appointment_duration
      t.integer :rating
      t.text :comments
      t.integer :student_id
      t.integer :tutor_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
