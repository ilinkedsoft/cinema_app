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
class Rating < ApplicationRecord
  belongs_to :movie

  validates :stars, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
