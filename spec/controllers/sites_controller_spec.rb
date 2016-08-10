require 'rails_helper'

RSpec.describe Api::SitesController, type: :request do
  describe "#index" do
    before { FactoryGirl.create(:site) }

    subject do
      get "/api/sites.json"
      JSON.parse(response.body)
    end

    it { expect(subject["sites"].size).to be > 0 }

    it "http status" do
      subject
      expect(response.status).to eq(200)
    end
  end

  describe '#create' do

    let(:site_index) do
      get "/api/sites.json"
      JSON.parase(response.body)
    end

    it "sholuld get 1 fata after create site" do

      post "/api/sites", :site => { :name => "11", :host => "22", :subdomain => "33", :data => "44"}

      expect(site_index["sites"].size).to be(1)
    end

  end
end