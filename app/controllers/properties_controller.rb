class PropertiesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_user
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  layout 'dashboard'
  
  # GET /properties
  # GET /properties.json
  def index
    @properties = @user.properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to dashboard_property_path(@property), notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to dashboard_property_path(@property), notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    return redirect_to dashboard_property_path unless @property.account_id == @user.account.id

    @property.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
    return redirect_to dashboard_property_path unless @property.account_id == @user.account.id
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(:street, :city, :state, :zip, :account_id).merge(:account_id => current_user.account.id)
  end
end
