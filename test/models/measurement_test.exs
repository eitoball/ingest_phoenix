defmodule IngestPhoenix.MeasurementTest do
  use IngestPhoenix.ModelCase

  alias IngestPhoenix.Measurement

  @valid_attrs %{captured_at: "2017-01-13T05:56:35Z", device_id: 1553490618, location: %Geo.Point{ coordinates: { -70.78382, 42.564835 }, srid: 4326 }, lora_snr: 7, lora_cpm: 25, payload: %{}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Measurement.changeset(%Measurement{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Measurement.changeset(%Measurement{}, @invalid_attrs)
    refute changeset.valid?
  end
end
