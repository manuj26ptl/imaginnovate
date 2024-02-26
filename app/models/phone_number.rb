class PhoneNumber < ApplicationRecord
  belongs_to :employee

  validates :phone_number,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 11 }
end
