class Reply < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :replier, presence: true
	validates :reply_to, presence: true, length: { maximum: 140 }
end
