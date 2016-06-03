require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let(:password) { 'password' }
  let(:current_user) { create(:user, password: password) }
  let!(:events) { create_list(:event, 2) }

  before(:each) do
    post user_session_path, user: { email: current_user.email, password: password }
  end

  describe 'GET /events' do
    before(:each) do
      get events_path
    end

    it 'responds with 200 ok' do
      expect(response).to have_http_status(200)
    end

    it 'renders index.html' do
      expect(response).to render_template :index
      expect(response.content_type).to eq 'text/html'
    end

    it 'shows events' do
      events.each do |event|
        expect(response.body).to include event.raw_data['name']
      end
    end
  end

  describe 'GET /event/1' do
    it
  end

  describe 'GET /events/new' do
    it
  end

  describe 'POST /events' do
    it
  end

  describe 'GET /events/1/edit' do
    it
  end

  describe 'PUT /events/1' do
    it
  end

  describe 'DELETE /events/1' do
    it
  end
end
