class SmstestingController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def dummy
		rand_num = rand().to_s[-9..-1]
    # render json: {"keys": {
    #   MessageID: rand_num
    #  },
    #  "values": {
    #    MessageName: "Testing SFMC",
    #    MessageQueuedStatus: "ET:0201",
    #    MessageQueuedStatusCode: "200",
    #    MessageContent: "ABCDEFG",
    #    PhoneNumber: "123456789",
    #    MessageID: rand_num,
    #    MessageDeliveryStatus: "DEL",
    #    MessageDeliveryStatusCode: "200"
    #   }
    # }
    render text: "command=MT_RESPONSE&spid=100941&mtmsgid=#{rand_num}&mtstat=ACCEPTD&mterrcode=000"
	end
end
