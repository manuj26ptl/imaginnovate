class Employee < ApplicationRecord
  has_many :phone_numbers

  validates :first_name, :last_name, :email, :date_of_joining, :salary, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true
end
