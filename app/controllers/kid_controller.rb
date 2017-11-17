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


  def continuously
  	pool = Concurrent::CachedThreadPool.new
  	pool.post do
  		sleep 1
  		puts "#{__method__} - TOTAL THREADS BEFORE SHUTDOWN from QUERY #{params[:query_number]}: \e[35m#{Thread.list.length}\e[0m"
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
  	pool.shutdown
  	puts "#{__method__} - TOTAL THREADS AFTER SHUTDOWN from QUERY #{params[:query_number]}: \e[35m#{Thread.list.length}\e[0m"
  end

  def continuously_no_pools
  	Thread.new do
  		sleep 1
  		puts "#{__method__} - TOTAL THREADS BEFORE SHUTDOWN from QUERY #{params[:query_number]}: \e[35m#{Thread.list.length}\e[0m"
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
  	puts "#{__method__} - TOTAL THREADS AFTER SHUTDOWN from QUERY #{params[:query_number]}: \e[35m#{Thread.list.length}\e[0m"
  end

end
