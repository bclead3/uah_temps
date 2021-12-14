require 'rails_helper'

RSpec.describe "place_temps/index", type: :view do
  before(:each) do
    assign(:place_temps, [
      PlaceTemp.create!(
        place: "Place",
        date: (Date.today - 1.day),
        temp: 2.5
      ),
      PlaceTemp.create!(
        place: "Place",
        date: Date.today,
        temp: 2.5
      )
    ])
  end

  it "renders a list of place_temps" do
    render
    assert_select "tr>td", text: "Place".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
