class User < ApplicationRecord
  has_secure_password

  has_many :appointments, foreign_key: :student_id, dependent: :destroy
  has_many :tutors, through: :appointments, class_name: "User"
  has_many :student_appointments, foreign_key: :tutor_id, class_name: "Appointment", dependent: :destroy 
  has_many :students, through: :student_appointments, class_name: "User"
  has_many :tutor_subjects, foreign_key: :tutor_id, dependent: :destroy 
  has_many :subjects, through: :tutor_subjects 
  
  validates :username, uniqueness: {message: "%{attribute}s must be unique and %{value} has already been taken."}

end
