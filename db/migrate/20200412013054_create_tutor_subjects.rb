class CreateTutorSubjects < ActiveRecord::Migration[6.0]
  def change
    create_table :tutor_subjects do |t|
      t.integer :tutor_id
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :tutor_subjects, :users, column: :tutor_id 
  end
end
