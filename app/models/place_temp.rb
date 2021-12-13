class PlaceTemp < ApplicationRecord

  def initialize(params)
    super
    write_attribute(:place, params[:place])
    write_attribute(:date, params[:date])
    write_attribute(:temp, params[:temp]&.to_f)
    write_attribute(:created_at, params[:created_at]) unless self.created_at.present?
    write_attribute(:updated_at, params[:updated_at])
  end
end
