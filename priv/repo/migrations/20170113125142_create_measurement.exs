defmodule IngestPhoenix.Repo.Migrations.CreateMeasurement do
  use Ecto.Migration

  def change do
    create table(:measurements) do
      add :captured_at, :utc_datetime, null: false
      add :location, :geometry, null: false
      add :device_id, :integer, null: false
      add :payload, :map, null: false

      timestamps()
    end

  end
end
