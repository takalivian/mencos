class Category < ApplicationRecord

  has_many :posts
  has_ancestry

end
