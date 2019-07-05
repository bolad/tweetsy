class Pack < ApplicationRecord
  belongs_to :user
  has_many :tweets, dependent: :destroy

  validates :name, presence: true
end
