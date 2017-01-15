defmodule IngestPhoenix.MeasurementController do
  use IngestPhoenix.Web, :controller

  plug IngestPhoenix.ValidateSolarcastPayload

  def create(conn, params) do
    %IngestPhoenix.Measurement{}
    |> IngestPhoenix.Measurement.changeset(%{
      captured_at: params["captured_at"],
      device_id: params["device_id"],
      location: geo_point(lon: params["longitude"], lat: params["latitude"]),
      payload: params
    })
    |> Repo.insert!

    conn |> put_status(202) |> json(%{ message: "Accepted" })
  end

  defp geo_point(lon: longitude, lat: latitude) do
    %Geo.Point{ coordinates: {longitude, latitude}, srid: 4326 }
  end
end
