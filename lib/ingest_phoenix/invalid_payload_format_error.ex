defmodule IngestPhoenix.InvalidPayloadFormatError do
  defexception [message: "Invalid payload format.",
                plug_status: 400]
end

defimpl Plug.Exception, for: IngestPhoenix.InvalidPayloadFormatError do
  def status(_), do: 400
end
