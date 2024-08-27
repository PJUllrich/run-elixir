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
      {:ex_doc, "~> 0.34.2", only: :dev, runtime: false},
      {:publishex, "~> 1.0.1", only: :dev, runtime: false}
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
        "guides/01-basics/hello-world.livemd",
        "guides/01-basics/lists-and-tuples.livemd",
        "guides/01-basics/maps.livemd",
        "guides/01-basics/keyword-lists.livemd",
        "guides/01-basics/modules.livemd",
        "guides/01-basics/structs.livemd",
        "guides/01-basics/functions.livemd",
        "guides/01-basics/pipes.livemd",
        "guides/01-basics/pattern-matching.livemd",
        "guides/01-basics/control-flow.livemd",
        "guides/01-basics/loops.livemd",
        "guides/02-start-coding/install-elixir.livemd",
        "guides/02-start-coding/create-a-phoenix-project.livemd",
        "guides/02-start-coding/install-dependencies.livemd",
        "guides/02-start-coding/deploy-your-project.livemd",
        "guides/03-next-steps/continue-learning.livemd",
        "guides/03-next-steps/join-the-community.livemd",
        "guides/03-next-steps/stay-informed.livemd",
        "guides/03-next-steps/find-a-job.livemd",
        "guides/03-next-steps/find-libraries.livemd",
        "guides/04-advanced-topics/async.livemd",
        "guides/04-advanced-topics/behaviours-and-protocols.livemd",
        "guides/04-advanced-topics/http.livemd",
        "guides/04-advanced-topics/logger.livemd",
        "guides/04-advanced-topics/macros.livemd",
        "guides/04-advanced-topics/big-o.livemd"
      ],
      groups_for_extras: [
        "The Basics": [~r"/01-basics/"],
        "Start Coding": [~r"/02-start-coding/"],
        "Next Steps": [~r"/03-next-steps/"],
        "Advanced Topics": [~r"/04-advanced-topics/"]
      ]
    ]
  end
end
