class ImagesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user
  
  def create
    model = params[:model].capitalize.constantize.find(params[:id])
    model.images.create(public_id: params[:public_id], name: params[:name])
    respond_to do |format|
      format.json { head :no_content }
    end    
  end  

  def destroy
    @image = Image.find_by_public_id(params[:public_id])
    @image.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_properties_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
