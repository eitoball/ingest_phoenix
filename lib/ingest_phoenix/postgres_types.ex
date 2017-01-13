Postgrex.Types.define(
  IngestPhoenix.PostgresTypes,
  [Geo.PostGIS.Extension] ++ Ecto.Adapters.Postgres.extensions(),
  json: Poison)
