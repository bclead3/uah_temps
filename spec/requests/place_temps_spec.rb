 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/place_temps", type: :request do
  
  # PlaceTemp. As you add validations to PlaceTemp, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      PlaceTemp.create! valid_attributes
      get place_temps_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      place_temp = PlaceTemp.create! valid_attributes
      get place_temp_url(place_temp)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" #do
    #   get new_place_temp_url
    #   expect(response).to be_successful
    # end
  end

  describe "GET /edit" do
    it "render a successful response" do
      place_temp = PlaceTemp.create! valid_attributes
      get edit_place_temp_url(place_temp)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new PlaceTemp" do
        expect {
          post place_temps_url, params: { place_temp: valid_attributes }
        }.to change(PlaceTemp, :count).by(1)
      end

      it "redirects to the created place_temp" do
        post place_temps_url, params: { place_temp: valid_attributes }
        expect(response).to redirect_to(place_temp_url(PlaceTemp.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new PlaceTemp" do
        expect {
          post place_temps_url, params: { place_temp: invalid_attributes }
        }.to change(PlaceTemp, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post place_temps_url, params: { place_temp: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested place_temp" do
        place_temp = PlaceTemp.create! valid_attributes
        patch place_temp_url(place_temp), params: { place_temp: new_attributes }
        place_temp.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the place_temp" do
        place_temp = PlaceTemp.create! valid_attributes
        patch place_temp_url(place_temp), params: { place_temp: new_attributes }
        place_temp.reload
        expect(response).to redirect_to(place_temp_url(place_temp))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        place_temp = PlaceTemp.create! valid_attributes
        patch place_temp_url(place_temp), params: { place_temp: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested place_temp" do
      place_temp = PlaceTemp.create! valid_attributes
      expect {
        delete place_temp_url(place_temp)
      }.to change(PlaceTemp, :count).by(-1)
    end

    it "redirects to the place_temps list" do
      place_temp = PlaceTemp.create! valid_attributes
      delete place_temp_url(place_temp)
      expect(response).to redirect_to(place_temps_url)
    end
  end
end