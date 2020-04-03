class TenantsController < ApplicationController
  before_action :set_tenant, only: [:show, :edit, :update, :destroy]

  # GET /tenants
  # GET /tenants.json
  def index
    @tenants = Tenant.all
    #@apartment = Apartment.find(params[@apartment])
    #@tenant.apartment = @apartment
    #
    #@apartment = current_apartment
    #@apartments = Apartment.where(id: current_user.id)
  end

  # GET /tenants/1
  # GET /tenants/1.json
  def show
     #@apartment = Apartment.find(params[:apartment_id])
    @tenant.apartment = @apartment
  end

  # GET /tenants/new
  def new
    @apartment = Apartment.find(params[:apartment_id])
    @tenant = Tenant.new

  end

  # GET /tenants/1/edit
  def edit
  end

  # POST /tenants
  # POST /tenants.json

  def create
    #@apartment = Apartment.find(params[:id])
    @tenant = Tenant.new(tenant_params)
    # @tenant = tenant
    @tenant.apartment = @apartment
    @tenant.user = current_user

    #@apartment = Apartment.find(params[:id])





# @apartment = Apartment.find(params[:apartment_id])



# @tenant.apartment.floor = @apartment.floor


    #respond_to do |format|
      if @tenant.save
        # format.html { redirect_to @tenant, notice: 'tenant was successfully created.' }
        # format.json { render :show, status: :created, location: @tenant }
        redirect_to apartment_path(@apartment)
      else
        #render :new
        # format.html { render :new }
        # format.json { render json: @tenant.errors, status: :unprocessable_entity }
        @tenant = Tenant.new
      render "tenants/show"
      end
    end


  # PATCH/PUT /tenants/1
  # PATCH/PUT /tenants/1.json
  def update
    @tenant.user = current_user
    #respond_to do |format|
      if @tenant.update(tenant_params)
        redirect_to apartment_path(@apartment)
        # format.html { redirect_to @tenant, notice: 'tenant was successfully updated.' }
        # format.json { render :show, status: :ok, location: @tenant }
      else
        render :edit
        # format.html { render :edit }
        # format.json { render json: @tenant.errors, status: :unprocessable_entity }
      end
    end


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
      #@apartment = Apartment.find(params[:id])
      #@apartment = @tenant.apartment_id
      #@tenant.apartment_id = Apartment.all#@apartments.each do |apartment|
        # apartment.floor + apartment.door
    end

        #end

      #@apartment = Apartment.find(params[:id])

    #end

    # Only allow a list of trusted parameters through.
    def tenant_params
      params.fetch(:tenant, {})
      params.require(:tenant).permit(:first_name, :last_name, :phone, :email)
    end

  end
