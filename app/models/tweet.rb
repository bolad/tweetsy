class Tweet < ApplicationRecord
  belongs_to :pack

  validates :message, presence: true
end
