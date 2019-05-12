require 'rails_helper'

RSpec.describe 'Rate API', type: :request do

  describe 'GET /get_ips' do

    context 'user get rate posts' do
      let!(:posts1) { create(:post, ip: '192.168.2.0', user: create(:user, login: 'login_1'))}
      let!(:posts2) { create(:post, ip: '192.168.2.0', user: create(:user, login: 'login_2'))}
      let!(:posts3) { create(:post, ip: '180.110.5.0', user: create(:user, login: 'login_3'))}

      before { get '/rates/get_ips' }

      it 'should return ip and login users' do
        expect(json).not_to be_empty
        expect(json['192.168.2.0']).to eq('login_1,login_2')
        expect(json['180.110.5.0']).to eq('login_3')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
