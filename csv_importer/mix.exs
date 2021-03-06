defmodule CsvImporter.Mixfile do
  use Mix.Project

  def project do
    [app: :csv_importer,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: escript_config,
     default_task: "import",
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:csv, "~> 1.1.0"},
      {:faker, "~> 0.5"}
    ]
  end


  defp escript_config do
    [ main_module: CsvImporter ]
  end
end
