defmodule Demo.FileLogger do
  @moduledoc """
  A simple Logger backend that logs to a file.
  DON'T USE THIS IN PRODUCTION, BUT USE THE BUILT-IN FILE LOGGER INSTEAD!
  """

  @default_path "./out.log"
  @default_format "$time [$level] $message\n"
  @default_level :debug

  def adding_handler(config) do
    # Merge the config with the default options
    opts = Map.get(config, :config, %{})
    default_opts = %{path: @default_path, level: @default_level, format: @default_format}
    opts = Map.merge(default_opts, opts)

    formatter = Logger.default_formatter(format: opts.format)
    opts = Map.put(opts, :formatter, formatter)

    # Open the file for writing
    file = opts.path |> Path.expand() |> File.open!([:append, :utf8])
    opts = Map.put(opts, :file, file)

    config = Map.put(config, :config, opts)
    {:ok, config}
  end

  def log(event, %{config: opts} = _config) do
    IO.inspect(event, label: "Event")
    IO.inspect(opts, label: "Config")

    if :logger.compare_levels(event.level, opts.level) != :lt do
      {:string, message} = event.msg

      line = opts.formatter.format(message) |> IO.inspect()

      IO.binwrite(opts.file, line)
    end

    :ok
  end

  def remove_handler(%{config: opts}) do
    # Close the file before the handler is removed from the application
    File.close(opts.path)

    :ok
  end
end
