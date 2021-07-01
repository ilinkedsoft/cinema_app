require "rails_helper"

RSpec.describe Rating, type: :model do
  let(:rating) { create(:rating) }

  it "has a valid factory" do
    expect(rating).to be_valid
  end
end
