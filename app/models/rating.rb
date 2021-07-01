class Rating < ApplicationRecord
  belongs_to :movie

  validates :stars, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
end
