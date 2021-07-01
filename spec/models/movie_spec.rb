# == Schema Information
#
# Table name: movies
#
#  id         :bigint           not null, primary key
#  title      :string
#  imdb_id    :string
#  starts     :datetime
#  ends       :datetime
#  price      :integer
#  currency   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { create(:movie) }

  it 'has a valid factory' do
    expect(movie).to be_valid
  end
end
