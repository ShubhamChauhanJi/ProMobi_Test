class Tutor < ApplicationRecord
  # == Schema Information
#
# Table name: courses
# name            string        Not null
# age             integer       Not Null
# experience      integer
#course_id        integer

  belongs_to :course
  validates :name, :experience, presence: true
  validates_uniqueness_of :name, case_sensitive: false
end
