require 'rails_helper'

RSpec.describe 'Post API', type: :request do

  describe 'POST /posts' do
    context 'when the request is valid' do
      let(:post_params) { {title: 'Learn Elm',
                           description: 'set',
                           ip: '192.168.2.0',
                           login: 'unknown'} }

      before { post '/posts', params: post_params }

      it 'creates a post' do
        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:post_params) { {title: 'Learn Elm', login: 'unknown'} }

      before { post '/posts', params: post_params }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
            .to match(/Validation failed: Description can't be blank/)
      end
    end
  end
end