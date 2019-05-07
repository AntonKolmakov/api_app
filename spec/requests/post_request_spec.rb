require 'rails_helper'

RSpec.describe 'Post API', type: :request do

  describe 'POST /posts' do
    # valid payload
    let(:post_params) { {title: 'Learn Elm', description: 'set', login: 'unknown'} }

    context 'when the request is valid' do
      before { post '/posts', params: post_params }

      it 'creates a post' do

        expect(json['title']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end