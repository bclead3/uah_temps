require 'rails_helper'

RSpec.describe "place_temps/new", type: :view do
  before(:each) do
    assign(:place_temp, PlaceTemp.new(
      place: "MyString",
      temp: 1.5
    ))
  end

  it "renders new place_temp form" do
    render

    assert_select "form[action=?][method=?]", place_temps_path, "post" do

      assert_select "input[name=?]", "place_temp[place]"

      assert_select "input[name=?]", "place_temp[temp]"
    end
  end
end
