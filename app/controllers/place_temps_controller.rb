class PlaceTempsController < ApplicationController
  before_action :set_place_temp, only: %i[ show edit update destroy ]

  # GET /place_temps or /place_temps.json
  def index
    @place_temps = PlaceTemp.all
  end

  # GET /place_temps/1 or /place_temps/1.json
  def show
  end

  # GET /place_temps/new
  def new
    @place_temp = PlaceTemp.new
  end

  # GET /place_temps/1/edit
  def edit
  end

  # POST /place_temps or /place_temps.json
  def create
    @place_temp = PlaceTemp.new(place_temp_params)

    respond_to do |format|
      if @place_temp.save
        format.html { redirect_to @place_temp, notice: "Place temp was successfully created." }
        format.json { render :show, status: :created, location: @place_temp }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /place_temps/1 or /place_temps/1.json
  def update
    respond_to do |format|
      if @place_temp.update(place_temp_params)
        format.html { redirect_to @place_temp, notice: "Place temp was successfully updated." }
        format.json { render :show, status: :ok, location: @place_temp }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @place_temp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /place_temps/1 or /place_temps/1.json
  def destroy
    @place_temp.destroy
    respond_to do |format|
      format.html { redirect_to place_temps_url, notice: "Place temp was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place_temp
      @place_temp = PlaceTemp.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_temp_params
      params.require(:place_temp).permit(:place, :date, :temp)
    end
end
