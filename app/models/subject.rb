class Subject < ApplicationRecord

  has_many :tutor_subjects
  has_many :tutors, through: :tutor_subjects, foreign_key: :subject_id, class_name: "User"
  has_many :appointments

end
