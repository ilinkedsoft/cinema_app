# == Schema Information
#
# Table name: ratings
#
#  id         :bigint           not null, primary key
#  movie_id   :bigint
#  stars      :integer
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:rating) { create(:rating) }

  it 'has a valid factory' do
    expect(rating).to be_valid
  end
end
