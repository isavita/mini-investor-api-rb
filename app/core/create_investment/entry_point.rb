# frozen_string_literal: true

module CreateInvestment
  class EntryPoint
    def self.call(campaign_id:, amount_pennies:)
      Action.new(campaign_id: campaign_id, amount_pennies: amount_pennies).call
    end
  end
end
