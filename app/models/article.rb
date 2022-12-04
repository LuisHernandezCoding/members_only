class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, :body, presence: true

  validates :title, length: { maximum: 140 }
end
