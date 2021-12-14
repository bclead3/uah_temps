# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PlaceTempsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/place_temps').to route_to('place_temps#index')
    end

    it 'routes to #new' do
      expect(get: '/place_temps/new').to route_to('place_temps#new')
    end

    it 'routes to #show' do
      expect(get: '/place_temps/1').to route_to('place_temps#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/place_temps/1/edit').to route_to('place_temps#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/place_temps').to route_to('place_temps#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/place_temps/1').to route_to('place_temps#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/place_temps/1').to route_to('place_temps#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/place_temps/1').to route_to('place_temps#destroy', id: '1')
    end
  end
end
