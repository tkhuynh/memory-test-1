class SmstestingController < ApplicationController
  skip_before_action :verify_authenticity_token
  include HTTParty
  def dummy
    rand_num = rand().to_s[-9..-1]
    url = "https://pierrysmsdev.herokuapp.com/smslogs?command=RT_REQUEST&spid=100941&mtmsgid=#{rand_num}&mttotal=3&mtseq=1&mtstat=DELIVRD&mterrcode=000"
    Thread.new do
      sleep 0.050
      HTTParty.get(url)
    end
    render text: "command=MT_RESPONSE&spid=100941&mtmsgid=#{rand_num}&mtstat=ACCEPTD&mterrcode=000"
  end
end
