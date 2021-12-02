class Api::V1::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    resource.persisted? ? register_success : register_failure
  end

  def register_success
    render json: {
      user: {
        email: resource.email,
        token: equest.env["warden-jwt_auth.token"]
      }
    }, status: :ok
  end

  def register_failure
    render json: { errors: resource.errors.messages },
           status: :unprocessable_entity
  end
end