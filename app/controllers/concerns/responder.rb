module Responder
  def simple_stream(type, frame_id, partial)
    respond_to do |format|
      format.html
      format.turbo_stream do
        render turbo_stream: turbo_stream.send(
          type,
          frame_id,
          partial: partial
        )
      end
    end
  end
end
