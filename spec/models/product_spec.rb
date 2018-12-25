require 'rails_helper'

RSpec.describe Product, type: :model do

  it "has a valid factory" do
    expect(FactoryBot.build(:product)).to be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
  it { is_expected.to validate_length_of(:name).is_at_least(3) }
  it { is_expected.to validate_length_of(:description).is_at_least(10) }
end
