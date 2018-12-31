# frozen_string_literal: true

class CampaignSerializer < Blueprinter::Base
  identifier :id

  fields :name, :sector

  field :country_name, name: :countryName
  field :target_amount_pennies, name: :targetAmount
  field :raised_amount_pennies, name: :raisedAmount
  field :multiplier_amount_pennies, name: :multiplierAmount

  field :raised_percentage, name: :raisedPercentage do |obj, _opts|
    ((obj.raised_amount_pennies / obj.target_amount_pennies.to_d) * 100).truncate(2)
  end
end
