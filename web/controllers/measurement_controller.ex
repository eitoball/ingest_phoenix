defmodule IngestPhoenix.MeasurementController do
  use IngestPhoenix.Web, :controller

  plug IngestPhoenix.ValidateSolarcastPayload

  def create(conn, params) do
    %IngestPhoenix.Measurement{}
    |> IngestPhoenix.Measurement.changeset(params)
    |> Repo.insert!

    conn |> put_status(202) |> json(%{ message: "Accepted" })
  end
end
