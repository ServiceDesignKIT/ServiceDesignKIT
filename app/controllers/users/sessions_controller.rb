class Users::SessionsController < Devise::SessionsController

  # GET /users/sign_in
  def new
    super
  end

  # POST /users/sign_in
  def create
    if request.format == :json

      authenticate = warden.authenticate(auth_options)

      if authenticate
        self.resource = authenticate
        sign_in(resource_name, resource)

        render json: { user: current_user, token: form_authenticity_token }, status: 201
      else
        render json: { errors: ["Login Credentials Failed"], token: form_authenticity_token }, status: 422
      end
    else
      super
    end
  end

  # DELETE /users/sign_out
  def destroy
    super
  end

end