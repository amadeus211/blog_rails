class Comment < ApplicationRecord
  belongs_to :post
  broadcasts_to :post
  validates :content, presence: { message: "Message cannot be empty. Please fill input form" }

end
