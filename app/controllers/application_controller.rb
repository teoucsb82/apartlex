class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    dashboard_path
  end
  
  def build_image(model)
    return unless params[:image_id].present?
    if params[:image_id].is_a?(Array)
      params[:image_id].each do |img_id|
        preloaded = Cloudinary::PreloadedFile.new(img_id)         
        raise "Invalid upload signature" unless preloaded.valid?
        model.images.create(public_id: preloaded.identifier)
      end
    else
      preloaded = Cloudinary::PreloadedFile.new(params[:image_id])         
      raise "Invalid upload signature" unless preloaded.valid?
      model.images.create(public_id: preloaded.identifier)
    end
  end

  def load_user
    @user = current_user
  end
end
