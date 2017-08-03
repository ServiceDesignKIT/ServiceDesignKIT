class Post < ActiveRecord::Base
	acts_as_taggable_on :subcategories,
                      :freetags

	validates :title, :body, :instruction, presence:true

  belongs_to :user

  has_many :post_categories
  has_many :categories, through: :post_categories

  has_many :comments, dependent: :destroy

  delegate :username, to: :user

  enum status: [ :pending, :published, :declined ]

	has_attached_file :image,
                    styles: { medium: "300x300"},
                    default_url: '/missing.png'

	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def owner
    self.user_id
  end

  def self.top_five_posts
    Post.left_joins(:comments)
        .group(:id)
        .order("COUNT(comments.id) DESC")
        .limit(5)
        .map(&:simple_serialize)
  end

  def simple_serialize
    SimplePostSerializer.new(self)
  end

end
