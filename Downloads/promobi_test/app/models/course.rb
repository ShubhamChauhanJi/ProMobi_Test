class Course < ApplicationRecord
# == Schema Information
#
# Table name: courses
# name            string        Not null
# description     text          Not Null
# cost            float

  has_many :tutors, dependent: :destroy
  accepts_nested_attributes_for :tutors, allow_destroy: true
  validates :name, :description,  presence: true
  validates_uniqueness_of :name, case_sensitive: false
end
