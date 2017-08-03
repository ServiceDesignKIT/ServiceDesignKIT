class Api::ApplicationController < ActionController::Base

  serialization_scope :view_context

  before_action :delete_empty_params!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid

  def record_not_found(error)
    render json: { error: error.message }, status: 404
  end

  def record_invalid(error)
    render json: { error: error.message }, status: 422
  end

  def authorize!
    unless current_user
      render json: { error: 'Unauthorized' }, status: 401
    end
  end

  def delete_empty_params!
    params.each do |k, v|
      params.delete(k) if v.to_s.squish.blank?
    end
  end

  private

    def json_request?
      request.format.json?
    end

end
