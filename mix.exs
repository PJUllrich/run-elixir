defmodule RunElixir.MixProject do
  use Mix.Project

  @source_url "https://github.com/PJUllrich/run-elixir"
  @version "0.0.1"

  def project do
    [
      app: :run_elixir,
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
      {:publishex, "~> 1.0.1", only: :dev, runtime: false},
      {:file_system, "~> 1.0", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      maintainers: ["Peter Ullrich"],
      description: "An quickstart guide to Elixir through examples",
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "welcome",
      source_url: @source_url,
      # assets: %{"notebooks/files" => "files"},
      # logo: "images/scholar_simplified.png",
      extra_section: "Guides",
      api_reference: false,
      extras: [
        "guides/welcome.livemd",
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
        "guides/02-start-coding/create-a-phoenix-project.md",
        "guides/02-start-coding/install-dependencies.md",
        "guides/02-start-coding/deploy-your-project.md",
        "guides/03-next-steps/continue-learning.md",
        "guides/03-next-steps/join-the-community.md",
        "guides/03-next-steps/stay-informed.md",
        "guides/03-next-steps/find-a-job.md",
        "guides/03-next-steps/find-libraries.md",
        "guides/04-async/async.livemd",
        "guides/04-async/spawn.livemd",
        "guides/04-async/task.livemd",
        "guides/04-async/genserver.livemd",
        "guides/04-async/supervisor.livemd",
        "guides/05-misc/big-o.livemd",
        "guides/05-misc/type-hierarchy.livemd"
      ],
      groups_for_extras: [
        "The Basics": [~r"/01-basics/"],
        "Start Coding": [~r"/02-start-coding/"],
        "Next Steps": [~r"/03-next-steps/"],
        Async: [~r"/04-async/"],
        Miscellaneous: [~r"/05-misc/"]
      ],
      before_closing_head_tag: &before_closing_head_tag/1,
      before_closing_body_tag: &before_closing_body_tag/1
    ]
  end

  defp before_closing_head_tag(:html) do
    """
    <script defer data-domain="runelixir.com" src="https://plausible.io/js/script.js"></script>
    """
  end

  defp before_closing_head_tag(:epub), do: ""

  defp before_closing_body_tag(:html) do
    key_navigation_script = File.read!("./assets/key-navigation.js")

    """
    <script>
      #{key_navigation_script}
    </script>
    """
  end

  defp before_closing_body_tag(:epub), do: ""
end
