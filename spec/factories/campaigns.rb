# frozen_string_literal: true

FactoryBot.define do
  factory :campaign do
    name { |i| "Company #{i}" }
    target_amount { 50_000 }
    multiplier_amount { 1 }
    sector { 'Finance' }
    country_name { 'United Kingdom' }
  end
end
