defmodule Amplitude.API.Real do
  @headers [content_type: "application/json", accept: "application/json"]

  defp api_host, do: Application.get_env(:amplitude, :api_host)
  defp api_key, do: Application.get_env(:amplitude, :api_key)

  def api_track(params) do
    case Req.post(api_host(),
           headers: @headers,
           json: %{api_key: api_key(), events: [params]}
         ) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Req.Response{status: 400, body: body}} ->
        IO.inspect(body, label: "body", pretty: true, limit: :infinity, printable_limit: :infinity)

        {:error, "Error from Amplitude: #{inspect(body)}"}

      {:ok, %Req.Response{status: status, body: body}} ->
        {:error, "Request with status: #{status} => #{inspect(body)}"}

      {:error, exception} ->
        {:error, exception}
    end
  end
end
