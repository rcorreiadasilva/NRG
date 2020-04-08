class TenantsController < ApplicationController
  #before_action :set_tenant, only: [:show, :edit, :update, :destroy]
  before_action :fetch_apartment, except: [:show, :index]


  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.all
    @tenants = policy_scope(Tenant).order(created_at: :desc)
    #@tenant = Tenant.find(params[:id])
    #@tenant = Tenant.find(params[:id])
     #tr4 = Apartment.find(6).tenants.first.first_name
     # => apartment(:id).tenants(@tenant)
      #@tenant = Apartment.find(params[:id]).tenants(tenant_params)

  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show

    @tenant = Tenant.find(params[:id])
    # @tenant.apartment works!
    authorize @tenant
  end

  # GET   # /apartments/:apartment_id/tenants/new
  def new

    @tenant = Tenant.new
    authorize @tenant
  end

  # GET /tenants/1/edit
  def edit
  end

  # POST /tenants
  # POST /tenants.json

  def create
    @tenant = Tenant.new(tenant_params)
    authorize @tenant
    # @tenant.apartment_id = params[:apartment_id]
    # @tenant.apartment_id = @apartment.id
    @tenant.apartment = @apartment
    @tenant.save
    redirect_to apartment_path(@apartment)


    # respond_to do |format|
    #   if @tenant.save
    #     format.html { redirect_to @tenant, notice: 'tenant was successfully created.' }
    #     format.json { render :show, status: :created, location: @tenant }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @tenant.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  # def update
  #   respond_to do |format|
  #     if @tenant.update(tenant_params)

  #       format.html { redirect_to @tenant, notice: 'tenant was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @tenant }
  #     else

  #       format.html { render :edit }
  #       format.json { render json: @tenant.errors, status: :unprocessable_entity }
  #     end
  #   end
 # end


  # DELETE /tenants/1
  # DELETE /tenants/1.json
  def destroy
    @tenant.destroy
    respond_to do |format|
      format.html { redirect_to tenants_url, notice: 'tenant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tenant
      @tenant = Tenant.find(params[:id])
    end

    def fetch_apartment
      @apartment = Apartment.find(params[:apartment_id])
    end

    # Only allow a list of trusted parameters through.
    def tenant_params
      params.fetch(:tenant, {})
      params.require(:tenant).permit(:first_name, :last_name, :phone, :email)
    end


  end
