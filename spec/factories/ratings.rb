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
FactoryBot.define do
  factory :rating do
    association :movie

    stars { 4 }
  end
end
