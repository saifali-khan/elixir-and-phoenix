defmodule JustDial do
  # def fetch_url() do
  #   case HTTPoison.get("https://www.justdial.com/Mumbai/Hotels/nct-10255012") do
  #     {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
  #       urls =
  #         body
  #         |> Floki.find(".resultbox")
  #         |> Enum.map(fn result_box ->
  #           name = result_box |> Floki.find(".resultbox_title_anchor") |> Floki.text()
  #           contact = result_box |> Floki.find(".callcontent") |> Floki.text()
  #           address = result_box |> Floki.find(".font15") |> Floki.text()
  #           ratings = result_box |> Floki.find(".resultbox_countrate") |> Floki.text()
  #           %{address: address, contact: contact, name: name, ratings: ratings}
  #         end)

  #       {:ok, urls}

  #     {:ok, %HTTPoison.Response{status_code: 404}} ->
  #       IO.puts("Not found :(")

  #     {:error, %HTTPoison.Error{reason: reason}} ->
  #       IO.inspect(reason)
  #   end
  # end



  def get_url() do
    case HTTPoison.get("https://www.justdial.com/Mumbai/Hotels/nct-10255012") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        urls =
        body
          |> Floki.find(".resultbox_title_anchor")
          |> Floki.attribute("href")

        {:ok, urls}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")

      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  def get_html_body({_, urls}) do
    urls
    |> Enum.map(fn url -> HTTPoison.get("https://www.justdial.com"<>url) end)
    |> Enum.map(fn {_, result} -> result.body |> Floki.parse_document(result.body) end)

  end
end

