class BasicSerializer < ActiveModel::Serializer

  def initialize(object, options = {})
    super(object, options)
  end

  delegate :current_user, to: :scope, allow_nil: true


end