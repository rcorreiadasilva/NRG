class ConsumptionsController < ApplicationController
  before_action :set_consumption, only: [:show, :edit, :update, :destroy]

  # GET /consumptions
  # GET /consumptions.json
  def index
    @consumptions = Consumption.all
  end

  # GET /consumptions/1
  # GET /consumptions/1.json
  def show
  end

  # GET /consumptions/new
  def new
    @apartment = Apartment.find(params[:apartment_id])
    @consumption = Consumption.new


  end

  # GET /consumptions/1/edit
  def edit
  end

  # POST /consumptions
  # POST /consumptions.json

  # def create
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @review = Review.new(review_params)
  #   @review.cocktail = @cocktail
  #   if @review.save
  #     redirect_to cocktail_path(@cocktail)
  #   else
  #     @dose = Dose.new
  #     render "cocktails/show"
  #   end
  # end



  def create
    @consumption = Consumption.new(consumption_params)
    @apartment = Apartment.find(params[:apartment_id])
    @consumption.apartment = @apartment
    # @apartment.user = current_user

    respond_to do |format|
      if @consumption.save
        format.html { redirect_to apartment_path(@apartment), notice: 'Consumption was successfully created.' }
        format.json { render :show, status: :created, location: apartment_path(@apartment) }
        # redirect_to apartment_path(@apartment)
      else
        render :new
        # format.html { render :new }
        # format.json { render json: @consumption.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumptions/1
  # PATCH/PUT /consumptions/1.json
  def update
    respond_to do |format|
      if @consumption.update(consumption_params)
        redirect_to apartment_path(@apartment)
        # format.html { redirect_to @consumption, notice: 'Consumption was successfully updated.' }
        # format.json { render :show, status: :ok, location: @consumption }
      else
        render :edit
        # format.html { render :edit }
        # format.json { render json: @consumption.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumptions/1
  # DELETE /consumptions/1.json
  def destroy
    @consumption.destroy
    respond_to do |format|
      format.html { redirect_to consumptions_url, notice: 'Consumption was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumption
      @consumption = Consumption.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consumption_params
      params.fetch(:consumption, {})
      params.require(:consumption).permit(:inireading, :lastreading, :paid, :start, :end )
    end

end
