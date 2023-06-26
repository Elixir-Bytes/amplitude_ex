defmodule Amplitude.Mixfile do
  use Mix.Project

  def project do
    [
      app: :amplitude,
      version: "0.2.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:req, "~> 0.3.10"},
      {:jason, "~> 1.4.0"}
    ]
  end
end
