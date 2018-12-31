module CreateInvestment
  class Action

    def initialize(campaign_id:, amount:)
      @campaign_id = campaign_id
      @amount = amount
    end

    def call
      Investment.transaction do
        investment.save!
        update_campaign
      end

      investment
    end

    private

    attr_reader :campaign_id, :amount

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
      { campaign: campaign, amount_pennies: amount }
    end

  end
end
