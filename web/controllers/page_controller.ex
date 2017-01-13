defmodule IngestPhoenix.PageController do
  use IngestPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
