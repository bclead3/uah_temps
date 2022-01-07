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

  def globe
    g = Gruff::Line.new 1200, true
    g.title = 'Global Temperature Anomaly'
    g.title_font_size = 30
    g.legend_font_size = 10
    g.marker_font_size = 10
    #byebug
    ref_dt = 1.day.ago
    arr = PlaceTemp.where(place: 'Globe').where('date < ?', ref_dt).order(:date).pluck(:date, :temp)
    label_h = {}
    arr.each_with_index do |sub_arr, label_index|
      date_str = sub_arr[0].to_s
      date_arr = date_str.split('-')
      if date_arr[1].to_i == 1
        label_h[label_index] = date_arr[0][2..3]
      else
        label_h[label_index] = '' #sub_arr[0].to_s
      end
    end
    temp_arr = arr.map{ |x| x[1] }
    # byebug
    g.labels = label_h
    g.data :Global, temp_arr
    g.write('public/img/globe.png')
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
