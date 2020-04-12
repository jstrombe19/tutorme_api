class TutorSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :tutor, class_name: "User"
end
