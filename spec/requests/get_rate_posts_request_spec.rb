require 'rails_helper'

RSpec.describe 'Rate API', type: :request do

  describe 'GET /get_rate_posts' do

    context 'user get rate posts' do
      let!(:posts) { create_list(:post, 10) }
      let(:rate_params) { {rate_value: 10} }

      before { get '/rates/get_rate_posts', params: rate_params }

      it 'should return top rate posts' do
        expect(json).not_to be_empty
        expect(json.first['value']).to eq(10)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
