class Message < ApplicationRecord
    after_commit on: :create do
        broadcast_append_to(
            @messages_channel,
            partial: "messages/message",
            locals: {message: self},
            target: "messages"
        )
    end
end
