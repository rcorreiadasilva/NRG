class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]


  # GET /apartments
  # GET /apartments.json
  def index
    if user_signed_in?
    @user = current_user.email

  end

    @apartments = policy_scope(Apartment).order(created_at: :desc)
    @apartments = Apartment.all
    @tenants = Tenant.all


    #@tenant = @apartment.tenants.first


    #@apartment = Apartment.find(:id)
    #@tenant = tenants(tenant_params)
    #@tenant = Tenant.find(params[:id])
    #@apartment.tenants = @tenant
  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  #end

  # GET /apartments/new
  def new
    if current_user.admin
    @apartment = Apartment.new
    authorize @apartment
    else
      swal("Hello world!", {
  button: false,
});
    end
  end

  # GET /apartments/1/edit
  def edit
  end

  #end

  # POST /apartments
  # POST /apartments.json
  def create
    # if current_user.admin
      @apartment = Apartment.new(apartment_params)
      authorize @apartment
      #@apartment.user = current_user

      respond_to do |format|
        if @apartment.save
          format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
          format.json { render :show, status: :created, location: @apartment }
        else
          format.html { render :new }
          format.json { render json: @apartment.errors, status: :unprocessable_entity }
        end
      end

#     else
#       swal("Hello world!", {
#   button: false,
# });
#     end


  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update

    @apartment.user = current_user
    respond_to do |format|
      if @apartment.update(apartment_params)
        format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
        format.json { render :show, status: :ok, location: @apartment }
      else
        format.html { render :edit }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy

    @apartment.destroy
    respond_to do |format|
      format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
      format.json { head :no_content }
    end

  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
      #@tenant = Apartment.find(apartment.id).tenants
      #@tenant = Tenant.find(params[:apartment_id])
      authorize @apartment
      #@consumption = Consumption.new
      # @tenant = Tenant.new
      # @tenant = Tenant.all


    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.fetch(:apartment, {})
      params.require(:apartment).permit(:building, :floor, :door)
    end
end
