# frozen_string_literal: true

class PlaceTempsController < ApplicationController
  include PlaceTempsConcern

  before_action :set_place_temp, only: %i[show] # edit update destroy

  # GET /place_temps or /place_temps.json
  def index
    respond_to do |format|
      format.json { @place_temps = PlaceTemp.order(:place, :date) }
      format.html { @place_temps = PlaceTemp.order(:place, :date).page params[:page] }
    end
  end

  # GET /place_temps/1 or /place_temps/1.json
  def show; end

  def new_format
    render json: new_hash_format # .to_json
  end

  def global
    graph = Scruffy::Graph.new
    graph.title = 'Global Graph'
    graph.renderer = Scruffy::Renderers::Standard.new
    # ref_dt = 35.years.ago  .where('date < ?', ref_dt)
    arr = PlaceTemp.where(place: 'Globe').order(:date).pluck(:date, :temp)
    temps = arr.map{ |x| x[1] }
    graph.add :line, 'Globe', temps
    graph.render to: 'globe.svg'
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
