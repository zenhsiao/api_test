require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET api/v1/events/:id" do

  	before do
  		@event = Event.create(:name => "xxx", :description => "yyy")
    end

    it "should have 200 status code" do
      get "/api/v1/events/#{@event.id}.json"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(JSON.parse(@event.to_json))
    end
  end

  describe "POST /api/v1/events/" do

    it "should succesfully create new event" do
      # post "/api/v1/events.json?name=xxx&description=yyy"

      params = {:name => "xxx", :description => "yyy"}
      post "/api/v1/events", :params => params

      expect(response).to have_http_status(200)
      expect(Event.count).to eq(1)
    end
  end

  describe "PATCH /api/v1/events/id" do
  	before do
  		@event = Event.create(:name => "xxx", :description => "yyy")
    end

    it "should succesfully update event" do

      params = {:name => "xxx11", :description => "yyy11"}
      patch "/api/v1/events/#{@event.id}", :params => params

      expect(response).to have_http_status(200)
      @event.reload
      # byebug
      expect(@event.name).to eq("xxx11")
      # expect(response.name).to eq("xxx11")
    end
  end

  describe "PATCH /api/v1/events/id" do
  	before do
  		@event = Event.create(:name => "xxx", :description => "yyy")
    end

    it "should succesfully update event" do

      params = {:name => " ", :description => " "}
      patch "/api/v1/events/#{@event.id}", :params => params

      expect(response).to have_http_status(400)
      
    end
  end

  describe "DELETE /api/v1/events/id" do
  	before do
  		@event = Event.create(:name => "xxx", :description => "yyy")
    end

    it "should succesfully delete event" do

      delete "/api/v1/events/#{@event.id}"

      expect(response).to have_http_status(200)
      expect(Event.count).to eq(0)
    end
  end

  describe "GET /api/v1/events" do
  	before do
  		@events = Event.all
    end

    it "should succesfully show events" do

      get "/api/v1/events/"

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq(JSON.parse(@events.to_json))
    end
  end
end
