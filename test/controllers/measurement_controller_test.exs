defmodule IngestPhoenix.MeasurementControllerTest do
  use IngestPhoenix.ConnCase

  test "empty params", %{conn: conn} do
    assert catch_error(post(conn, measurement_path(conn, :create, %{})))
  end

  test "valid params", %{conn: conn} do
    params = %{
      "captured_at": "2017-01-13T05:56:35Z",
      "device_id": 1553490618,
      "latitude": 42.564835,
      "longitude": -70.78382,
      "lora_snr": 7,
      "lora_cpm": 25,
      "transport": "http:50.250.38.70:46306"
    }
    conn = post(conn, measurement_path(conn, :create), params)

    assert(conn.status == 202)
    count = IngestPhoenix.Repo.one(from m in IngestPhoenix.Measurement, select: count(m.id))
    assert(count == 1)
  end
end
