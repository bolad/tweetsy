class Tweet < ApplicationRecord
  # belongs_to :packs

  validates :message, presence: true
end
