class PlaceTemp < ApplicationRecord
  paginates_per 100

  validates :place, presence: true
  validates :date, presence: true
  validates :temp, presence: true
  validates :temp, numericality: true

  def initialize(params)
    super
    write_attribute(:place, params[:place])
    write_attribute(:date, params[:date])
    write_attribute(:temp, params[:temp]&.to_f)
    write_attribute(:created_at, DateTime.now) unless self.created_at.present?
    write_attribute(:updated_at, DateTime.now)
  end

  def to_h
    {
      id: self.id,
      place: self.place,
      date: self.date.to_s,
      temp: self.temp
    }
  end
end
