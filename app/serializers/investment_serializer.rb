# frozen_string_literal: true

class InvestmentSerializer < Blueprinter::Base
  identifier :id

  field :campaign_id, name: :campaignId
  field :amount_pennies, name: :amount
end
