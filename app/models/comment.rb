class Comment < ApplicationRecord
  include Visible
  belongs_to :post
  belongs_to :user
end
