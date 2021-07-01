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
FactoryBot.define do
  factory :movie do
    sequence :title do |n|
      "Test movie #{n}"
    end
    imdb_id { 'tt0232500' }
    starts { Time.current }
    ends { 1.hour.from_now }
    price { 100 }
    currency { 'Euro' }
  end
end
