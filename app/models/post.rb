class Post < ApplicationRecord
  include Visible
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
