# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { is_expected.to monetize(:target_amount).with_currency(:gbp) }
  it { is_expected.to monetize(:multiplier_amount).with_currency(:gbp) }
  it { is_expected.to monetize(:raised_amount).with_currency(:gbp) }
end
