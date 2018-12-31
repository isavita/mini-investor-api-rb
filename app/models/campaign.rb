# frozen_string_literal: true

class Campaign < ApplicationRecord
  validates_presence_of :name, :target_amount_pennies

  monetize :target_amount_pennies
  monetize :multiplier_amount_pennies
  monetize :raised_amount_pennies
end
