# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/place_temps', type: :request do
  # PlaceTemp. As you add validations to PlaceTemp, be sure to
  # adjust the attributes here as well.
  let(:line_arr) do
    %w[1978 12 -0.48 -0.51 -0.47 -0.44 -0.46 -0.42 -0.52 -0.62 -0.50 -0.60 -0.62 -0.59 -0.37 -0.44 -0.30 -0.46 -0.55 -0.45 -0.39 -0.68 -0.06 -0.45 -0.38 -0.49 -1.29 -1.15
       -1.29].map(&:to_f)
  end

  let(:valid_attributes_global) do
    { place: 'Global', date: '1978-12-01', temp: -0.48 }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      PlaceTemp.find_or_create_by valid_attributes_global
      get place_temps_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      place_temp = PlaceTemp.find_or_create_by valid_attributes_global
      get place_temp_url(place_temp)
      expect(response).to be_successful
    end
  end

  describe "GET /new_format" do
    it "renders a successful response" do
      get new_format_url
      expect(response).to be_successful
    end
  end
  #
  # describe "GET /edit" do
  #   it "render a successful response" do
  #     place_temp = PlaceTemp.create! valid_attributes
  #     get edit_place_temp_url(place_temp)
  #     expect(response).to be_successful
  #   end
  # end
  #
  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new PlaceTemp" do
  #       expect {
  #         post place_temps_url, params: { place_temp: valid_attributes }
  #       }.to change(PlaceTemp, :count).by(1)
  #     end
  #
  #     it "redirects to the created place_temp" do
  #       post place_temps_url, params: { place_temp: valid_attributes }
  #       expect(response).to redirect_to(place_temp_url(PlaceTemp.last))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "does not create a new PlaceTemp" do
  #       expect {
  #         post place_temps_url, params: { place_temp: invalid_attributes }
  #       }.to change(PlaceTemp, :count).by(0)
  #     end
  #
  #     it "renders a successful response (i.e. to display the 'new' template)" do
  #       post place_temps_url, params: { place_temp: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested place_temp" do
  #       place_temp = PlaceTemp.create! valid_attributes
  #       patch place_temp_url(place_temp), params: { place_temp: new_attributes }
  #       place_temp.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "redirects to the place_temp" do
  #       place_temp = PlaceTemp.create! valid_attributes
  #       patch place_temp_url(place_temp), params: { place_temp: new_attributes }
  #       place_temp.reload
  #       expect(response).to redirect_to(place_temp_url(place_temp))
  #     end
  #   end
  #
  #   context "with invalid parameters" do
  #     it "renders a successful response (i.e. to display the 'edit' template)" do
  #       place_temp = PlaceTemp.create! valid_attributes
  #       patch place_temp_url(place_temp), params: { place_temp: invalid_attributes }
  #       expect(response).to be_successful
  #     end
  #   end
  # end
  #
  # describe "DELETE /destroy" do
  #   it "destroys the requested place_temp" do
  #     place_temp = PlaceTemp.create! valid_attributes
  #     expect {
  #       delete place_temp_url(place_temp)
  #     }.to change(PlaceTemp, :count).by(-1)
  #   end
  #
  #   it "redirects to the place_temps list" do
  #     place_temp = PlaceTemp.create! valid_attributes
  #     delete place_temp_url(place_temp)
  #     expect(response).to redirect_to(place_temps_url)
  #   end
  # end
end
