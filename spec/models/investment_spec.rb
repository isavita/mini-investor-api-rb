require 'rails_helper'

RSpec.describe Investment, type: :model do
  it { is_expected.to monetize(:amount).with_currency(:gbp) }
end
