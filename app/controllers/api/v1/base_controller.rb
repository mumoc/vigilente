class Api::V1::BaseController < ActionController::API
  include ActionController::Serialization

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    render json: {error: 'not_found'}, status: :not_found
  end

  def default_serializer_options
    {root: false}
  end
end
