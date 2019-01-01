# frozen_string_literal: true

module CreateInvestment
  class Validator
    class NegativeAmountError < StandardError; end
    class IncorrectAmountError < StandardError; end

    def initialize(amount_pennies:, multiplier:)
      @amount_pennies = amount_pennies
      @multiplier = multiplier
    end

    def call
      raise NegativeAmountError unless amount_pennies.positive?
      raise IncorrectAmountError unless amount_multiple_of_multiplier?
    end

    private

    attr_reader :amount_pennies, :multiplier

    def amount_multiple_of_multiplier?
      amount_pennies % multiplier == 0
    end
  end
end
