class CategorySerializer < BasicSerializer
  attributes :id,
             :name

  has_many :sub_categories
end
