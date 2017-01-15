defmodule IngestPhoenix.Measurement do
  use IngestPhoenix.Web, :model

  schema "measurements" do
    field :captured_at, Ecto.DateTime
    field :location, Geo.Point
    field :device_id, :integer
    field :payload, :map
    field :longitude, :float, virtual: true
    field :latitude, :float, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:captured_at, :longitude, :latitude, :device_id])
    |> validate_required([:captured_at, :longitude, :latitude, :device_id, ])
    |> put_payload()
    |> put_location()
  end

  defp put_payload(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: changes, data: data} ->
        payload = data.payload || %{}
        put_change(changeset, :payload, Map.merge(payload, changes))
      _ -> changeset
    end
  end

  defp put_location(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{longitude: lon, latitude: lat}} ->
        put_change(changeset, :location, %Geo.Point{ coordinates: { lon, lat }, srid: 4326  })
      _ -> changeset
    end
  end
end
