class ApiV1::EventsController < ApiController

	def index
		@events = Event.all
		render :json => @events.to_json
	end
	def show
		@event = Event.find(params[:id])
		render :json => @event.to_json
	end
	def create
		@event = Event.new(:name => params[:name], :description => params[:description])
		if @event.save
			 render :json => {:message => "ok", :event => @event.to_json}
		else
			 render :json => {:message => "Failed!"}, :status =>400
		end
	end
	def update
		@event = Event.find(params[:id])
		if @event.update(:name => params[:name], :description => params[:description])
			render :json => { :message => "ok", :event =>{:name => params[:name]}}
		else
			render :json => {:message => "Failed!"}, :status =>400
		end
	end

	def destroy
		@event = Event.find_by_id(params[:id])
		if @event
		  @event.destroy
			render :json => { :message => "ok" }
		else
			render :json => { :message => "the event doesn't exist" }, :status =>400
		end
	end




end
