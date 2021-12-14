# frozen_string_literal: true

module PlaceTempsHelper
  def format_date(date)
    date&.to_s[0..6]
  end
end
