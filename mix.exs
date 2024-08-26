defmodule ElixirByExample.MixProject do
  use Mix.Project

  @source_url "https://github.com/PJUllrich/elixir-by-example"
  @version "0.0.1"

  def project do
    [
      app: :elixir_by_example,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: &docs/0,
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.34", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Peter Ullrich"],
      description: "An introduction to Elixir through examples",
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      # assets: %{"notebooks/files" => "files"},
      # logo: "images/scholar_simplified.png",
      extra_section: "Guides",
      api_reference: false,
      extras: [
        "README.md",
        "guides/01-basics/welcome.livemd",
        "guides/01-basics/lists-and-tuples.livemd",
        "guides/01-basics/maps.livemd",
        "guides/01-basics/keyword-lists.livemd",
        "guides/01-basics/modules.livemd",
        "guides/01-basics/structs.livemd",
        "guides/01-basics/functions.livemd",
        "guides/01-basics/pattern-matching.livemd",
        "guides/09-misc/big-o.livemd"
      ],
      groups_for_extras: [
        "The Basics": [~r"/01-basics/"],
        Miscellaneous: [~r"/09-misc/"]
      ],
      deps: [req: "https://hexdocs.pm/req"]
    ]
  end
end
