defmodule IngestPhoenix.MeasurementTest do
  use IngestPhoenix.ModelCase

  alias IngestPhoenix.Measurement

  @valid_attrs %{captured_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, device_id: 42, payload: %{}}
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
