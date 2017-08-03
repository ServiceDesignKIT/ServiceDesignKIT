class Users::ConfirmationsController < Devise::ConfirmationsController

  # POST /resource/confirmation
  def create
    if request.format == :json
      self.resource = resource_class.send_confirmation_instructions(resource_params)
      yield resource if block_given?

      if successfully_sent?(resource)
        render json: { token: form_authenticity_token  }, status: 200
      else
        render json: { token: form_authenticity_token  }, status: 404
      end
    else
      super
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    if request.format == :json
      self.resource = resource_class.confirm_by_token(params[:confirmation_token])
      yield resource if block_given?

      if resource.errors.empty?
        set_flash_message!(:notice, :confirmed)
        respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
      else
        respond_with_navigational(resource.errors, status: :unprocessable_entity){ render :new }
      end
    else
      super
    end
  end

  def after_confirmation_path_for(resource_name, resource)
   sign_in(resource)
   root_path
 end

end