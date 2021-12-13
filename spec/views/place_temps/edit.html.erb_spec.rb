require 'rails_helper'

RSpec.describe "place_temps/edit", type: :view do
  before(:each) do
    @place_temp = assign(:place_temp, PlaceTemp.create!(
      place: "MyString",
      temp: 1.5
    ))
  end

  it "renders the edit place_temp form" do
    render

    assert_select "form[action=?][method=?]", place_temp_path(@place_temp), "post" do

      assert_select "input[name=?]", "place_temp[place]"

      assert_select "input[name=?]", "place_temp[temp]"
    end
  end
end
