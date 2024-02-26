class Employee < ApplicationRecord
  has_many :phone_numbers, dependent: :destroy
  has_one :tax


  validates :first_name, :last_name, :email, :date_of_joining, :salary, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true


  def calculate_yearly_salary
    # Calculate total salary considering the number of months worked in the current financial year
    current_year = Date.current.year
    financial_year_start = Date.new(current_year - 1, 4, 1)
    financial_year_end = Date.new(current_year, 3, 31)

    doj_in_financial_year = [date_of_joining, financial_year_start].max
    months_worked = (financial_year_end.year * 12 + financial_year_end.month) - (doj_in_financial_year.year * 12 + doj_in_financial_year.month) + 1
    total_salary = salary * months_worked
  end

  def calculate_tax
    yearly_salary = calculate_yearly_salary
    tax_amount = 0

    if yearly_salary <= 250000
      tax_amount = 0
    elsif yearly_salary <= 500000
      tax_amount = (yearly_salary - 250000) * 0.05
    elsif yearly_salary <= 1000000
      tax_amount = 12500 + (yearly_salary - 500000) * 0.10
    else
      tax_amount = 62500 + (yearly_salary - 1000000) * 0.20
    end

    tax_amount
  end

  def calculate_cess
    yearly_salary = calculate_yearly_salary
    cess_amount = 0

    # Collect additional 2% cess for the amount more than 2500000
    if yearly_salary > 2500000
      cess_amount = (yearly_salary - 2500000) * 0.02
    end

    cess_amount
  end
end
