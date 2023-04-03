defmodule GithubUserIdApiWeb.PageLive do
  use GithubUserIdApiWeb, :live_view
@impl true
  def mount(_params, _session, socket) do
{:ok, assign(socket, profile: nil)}
  end

  @impl true

  def handle_event("submit", %{"input_value" => username}, socket) do
    case HTTPoison.get("https://api.github.com/users/#{username}") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        json = Poison.decode!(body)
        {:noreply, assign(socket, profile: json)}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:noreply, assign(socket, error: "User not found")}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:noreply, assign(socket, error: "Error: #{reason}")}
    end
  end
end
