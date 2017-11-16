class KidController < ApplicationController
	skip_before_action :verify_authenticity_token
	require 'memory_profiler'
  def create
  	report = MemoryProfiler.report do
	  	states = States.get
	  	kid = {name: params[:name],email: params[:email],state: states[params[:state].to_s.to_sym]}
	  	found_kid = Kid.where(email: params[:email]).first
	  	if found_kid
	  		render json: { message: 'kid exist'}
	  	else
	  		created_kid = Kid.create(kid)
	  		render json: kid
	  	end
	  end
	  report.pretty_print
  end
end
