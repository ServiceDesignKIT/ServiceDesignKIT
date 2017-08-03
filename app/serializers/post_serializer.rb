class PostSerializer < BasicSerializer
  attributes :id,
             :title,
             :body,
             :instruction,
             :references,
             :image,
             :subcategory_list,
             :freetag_list,
             :user_id,
             :comments

  attribute :is_favorite, if: :check_is_favorite?

  def is_favorite
    true
  end

  def check_is_favorite?
    return false unless current_user
    current_user.favorite_posts.include?(object)
  end


  has_many :comments
end
