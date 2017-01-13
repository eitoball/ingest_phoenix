defmodule IngestPhoenix.Measurement do
  use IngestPhoenix.Web, :model

  schema "measurements" do
    field :captured_at, Ecto.DateTime
    field :location, Geo.Point
    field :device_id, :integer
    field :payload, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:captured_at, :location, :device_id, :payload])
    |> validate_required([:captured_at, :location, :device_id, :payload])
  end
end
