# frozen_string_literal: true

module CreateInvestment
  class Action
    def initialize(campaign_id:, amount_pennies:)
      @campaign_id = campaign_id
      @amount_pennies = Integer(amount_pennies)
    end

    def call
      validate!

      Investment.transaction do
        investment.save!
        update_campaign
      end

      investment
    end

    private

    attr_reader :campaign_id, :amount_pennies

    def validate!
      Validator.new(
        amount_pennies: amount_pennies, multiplier: campaign.multiplier_amount_pennies
      ).call
    end

    def update_campaign
      campaign.raised_amount_pennies += investment.amount_pennies
      campaign.save!
    end

    def investment
      @investment ||= Investment.new(attributes)
    end

    def campaign
      @campaign ||= Campaign.lock.find(campaign_id)
    end

    def attributes
      { campaign: campaign, amount_pennies: amount_pennies }
    end
  end
end
