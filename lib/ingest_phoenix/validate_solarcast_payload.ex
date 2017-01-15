defmodule IngestPhoenix.ValidateSolarcastPayload do
  def init(default), do: default

  def call(%Plug.Conn{params: params} = conn, _default) do
    if ExJsonSchema.Validator.valid?(schema(), params) do
      conn
    else
      raise IngestPhoenix.InvalidPayloadFormatError
    end
  end

  def schema do
    %{
      "type" => "object",
      "properties" => %{
        "device_id" => %{
          "type" => "integer"
        },
        "captured_at" => %{
          "type" => "string"
        },
        "latitude" => %{
          "type" => "number"
        },
        "longitude" => %{
          "type" => "number"
        },
      },
      "required" => ~w(device_id captured_at latitude longitude)
    }
  end
end
