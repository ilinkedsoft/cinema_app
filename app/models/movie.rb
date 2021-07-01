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
class Movie < ApplicationRecord
  has_many :ratings, dependent: :destroy
  
  validates :title, :imdb_id, :starts, :ends, presence: true
  validates :title, uniqueness: true
  validates :ends, date: { after: :starts }
end
