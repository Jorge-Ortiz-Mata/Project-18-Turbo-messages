class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        render partial: "messages/form"
        @message.save
    end
  
    private
      def message_params
        params.require(:message).permit(:content)
      end
end