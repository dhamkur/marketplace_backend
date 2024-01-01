module Responder
  def simple_stream(type, frame_id, partial)
    respond_to do |format|
      format.html { redirect_to @config[:redirect_location] }
      format.turbo_stream do
        render turbo_stream: turbo_stream.send(
          type,
          frame_id,
          partial: partial
        )
      end
    end
  end

  def delete_stream(object)
    respond_to do |format|
      format.html { redirect_to @config[:redirect_location] }
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(object)
      end
    end
  end
end
