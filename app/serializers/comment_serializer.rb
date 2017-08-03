class CommentSerializer < BasicSerializer
  include ActionView::Helpers::DateHelper

  attributes :id,
             :user,
             :content,
             :created

  def created
    time_ago_in_words(object.created_at)
  end

end
