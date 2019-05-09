require 'rails_helper'

RSpec.describe 'Rate API', type: :request do

  describe 'GET /get_ips' do

    context 'user get rate posts' do
      let!(:posts) { create_pair(:post)}

      before { get '/rates/get_ips' }

      it 'should return ip and login users' do
        expect(json).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
