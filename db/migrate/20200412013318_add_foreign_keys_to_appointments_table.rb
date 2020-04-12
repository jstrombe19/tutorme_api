class AddForeignKeysToAppointmentsTable < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :appointments, :users, column: :tutor_id
    add_foreign_key :appointments, :users, column: :student_id
    add_foreign_key :appointments, :subjects, column: :subject_id
  end
end
