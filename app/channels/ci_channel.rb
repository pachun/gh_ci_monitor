class CiChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ci"
  end

  def unsubscribed
  end
end
