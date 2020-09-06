class Tweet < ApplicationRecord
  belongs_to :user
	has_many :likes
	has_many :retweets
	enum status: [:draft, :published]
	paginates_per 10 
end
