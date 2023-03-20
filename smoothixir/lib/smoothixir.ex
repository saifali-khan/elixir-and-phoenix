defmodule Smoothixir do

  def get_smoothies_url() do
    case HTTPoison.get("https://www.allrecipes.com/recipes/138/drinks/smoothies/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        urls =
        body
          |> Floki.find("a.mntl-card")
          |> Floki.attribute("href")

        {:ok, urls}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def get_smoothies_html_body({_, urls}) do
    urls
    |> Enum.map(fn url -> HTTPoison.get(url) end)
    |> Enum.map(fn {_, result} -> result.body |> Floki.parse_document() end)
    |> Enum.map(fn {_, body} -> body end)
  end

  def get_smoothie_ingredients(body) do
    body
    |> Floki.find("li.mntl-structured-ingredients__list-item  p")
    |> Floki.text()
  end

  def get_smoothie_name(body) do
    body
    |> Floki.find("h1#article-heading_2-0")
    |> Floki.text()
  end

  def get_smoothie_directions(body) do
    body
    |> Floki.find("p#mntl-sc-block_2-0-2")
    |> Floki.text()
  end

  def get_smoothies_recipe() do
    smoothies =
      get_smoothies_url()
      |> get_smoothies_html_body()
      |> Enum.map(fn body ->
        %{
          name: get_smoothie_name(body),
          ingredients: get_smoothie_ingredients(body),
          directions: get_smoothie_directions(body)
        }
      end)

    {:ok, smoothies}
  end

  def display_smoothies({_, smoothies}) do
    smoothies
    |> Enum.map(fn s ->
      IO.puts(s.name)
      IO.puts(s.ingredients)
      IO.puts(s.directions)
      IO.puts("+++++++++++++++++++++++++++++")
    end)
  end
end
