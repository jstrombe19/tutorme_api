class Appointment < ApplicationRecord

  belongs_to :student, class_name: "User"
  belongs_to :tutor, class_name: "User"
  belongs_to :subject
  
end
