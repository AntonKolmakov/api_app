require 'rails_helper'

RSpec.describe 'Rate API', type: :request do

  describe 'POST /rates' do

    context 'when the request is valid' do
      let(:post_blog) { create :post }
      let(:rate_params) { {value: 5, post_id: post_blog.id} }

      before { post '/rates', params: rate_params }

      it 'request should return average rate to the post' do
        expect(json.first['value']).to eq(7)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:rate_params) { {value: 5} }

      before { post '/rates', params: { title: rate_params } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Post must exist/)
      end
    end
  end
end

