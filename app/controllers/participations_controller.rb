class ParticipationsController < ApplicationController

	def participate
		event = Event.find(params[:event_id])
		participation = current_user.participations.build(event_id: event.id)
		participation.save
		redirect_to event
	end

	def cancel
	end
end
