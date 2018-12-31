# frozen_string_literal: true

module CreateInvestment
  class EntryPoint
    def self.call(campaign_id:, amount:)
      Action.new(campaign_id: campaign_id, amount: amount).call
    end
  end
end
