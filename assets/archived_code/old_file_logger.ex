defmodule Demo.FileLogger do
  @moduledoc "A simple logger backend that writes to a log file."

  @behaviour :gen_event

  @default_path "./out.log"
  @default_format "$date $time [$level] $message\n"
  @default_level :debug

  # This callback is called if you start the backend using
  # Logger.add_backend(Demo.FileLogger) or in your configuration file with
  # config :logger, backends: [Demo.FileLogger]
  def init(__MODULE__) do
    {:ok, configure(:file_log)}
  end

  # This callback is called if you add this backend in
  # your configuration file as:
  # config :logger, backends: [{Demo.FileLogger, :file_log}]
  def init({__MODULE__, name}) do
    {:ok, configure(name)}
  end

  # We can change our Logger configuration during runtime
  # using the `Logger.configure_backend/2` function.
  #
  # Our custom backend needs to handle these configuration updates.
  # That's what this callback does.
  def handle_call({:configure, opts}, state) do
    {:ok, :ok, configure(state.name, opts)}
  end

  # Handle a new log message.
  def handle_event({level, gl, {Logger, message, timestamp, metadata}}, state) do
    # Only log if the log comes from this node and its level is not lower
    # than the configured log level.
    if gl == node() && Logger.compare_levels(level, state.level) != :lt do
      :ok = log_event(level, message, timestamp, metadata, state)
    end

    {:ok, state}
  end

  # The Logger might receive a "flush" event, but we write the logs
  # directly to our file, so we don't need to flush them explicitly.
  def handle_event(:flush, state), do: {:ok, state}

  defp configure(name, opts \\ nil) do
    default_opts = [
      name: name,
      format: @default_format,
      path: @default_path,
      level: @default_level
    ]

    # Fetch the configuration from e.g. `config/config.exs`
    opts = opts || Application.get_env(:logger, name, [])
    opts = default_opts |> Keyword.merge(opts) |> Map.new()

    # Compile the format
    opts = Map.put(opts, :format, Logger.Formatter.compile(opts.format))

    # Close the old log file if it was opened previously.
    if opts[:file], do: File.close(opts.file)

    # Open the new log file
    file = opts.path |> Path.expand() |> File.open!([:append, :utf8])
    Map.put(opts, :file, file)
  end

  # Format the message and write it to the log file
  defp log_event(level, message, timestamp, metadata, state) do
    line = Logger.Formatter.format(state.format, level, message, timestamp, metadata)
    :ok = IO.binwrite(state.file, line)
  end
end
