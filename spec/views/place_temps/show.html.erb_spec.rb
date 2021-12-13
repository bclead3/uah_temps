require 'rails_helper'

RSpec.describe "place_temps/show", type: :view do
  before(:each) do
    @place_temp = assign(:place_temp, PlaceTemp.create!(
      place: "Place",
      temp: 2.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Place/)
    expect(rendered).to match(/2.5/)
  end
end
