# frozen_string_literal: true

module PlaceTempsHelper
  def format_date(date)
    # rubocop:disable Lint/SafeNavigationChain
    date&.to_s[0..6]
    # rubocop:enable Lint/SafeNavigationChain
  end
end
