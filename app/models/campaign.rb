class Campaign < ApplicationRecord

  # validations
  validates_presence_of :name, :target_amount_pennies

  monetize :target_amount_pennies
  monetize :multiplier_amount_pennies
  monetize :raised_amount_pennies

end
