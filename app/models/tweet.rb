class Tweet < ApplicationRecord
  belongs_to :user
	has_many :likes
	has_many :retweets
	enum status: [:draft, :published]
end
