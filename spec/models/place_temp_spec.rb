require 'rails_helper'

RSpec.describe PlaceTemp, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'creates a valid PlaceTemp entry' do
    plc_temp = PlaceTemp.new( place: 'N America', date: Date.today, temp: -1.4)
  end
end
