defmodule GithubUserIdApiWeb.PageController do
  use GithubUserIdApiWeb, :controller
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
