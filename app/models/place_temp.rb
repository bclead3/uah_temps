class PlaceTemp < ApplicationRecord

  def initialize(params)
    super
    write_attribute(:place, params[:place])
    write_attribute(:date, params[:date])
    write_attribute(:temp, params[:temp]&.to_f)
    write_attribute(:created_at, DateTime.now) unless self.created_at.present?
    write_attribute(:updated_at, DateTime.now)
  end
end
