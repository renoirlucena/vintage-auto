# app/controllers/registrations_controller.rb

class RegistrationsController < Devise::RegistrationsController
  skip_before_action :authenticate_user!

  # ... other actions ...

  def update
    # Check if the user uploaded a new avatar
    if params[:user][:avatar].present?
      # Upload the image to Cloudinary
      result = Cloudinary::Uploader.upload(params[:user][:avatar])

      # Update the user's avatar URL in the database with the Cloudinary URL
      current_user.update(avatar: result['secure_url'])
    end

    # Continue with the regular update action
    super
  end

  # ... other actions ...

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  end
end
