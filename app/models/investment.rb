# frozen_string_literal: true

class Investment < ApplicationRecord
  belongs_to :campaign

  validates_presence_of :amount_pennies

  monetize :amount_pennies
end
