# Welcome to Elixir!

[Elixir](https://elixir-lang.org) is a dynamic, functional programming language created by [José Valim](https://github.com/josevalim). It is great for building scalable and maintainable applications. It also puts the FUN into **FUN**ctional programming! This guide will walk you through its basics in less than 30 minutes. Let's get started.

## Install Elixir

Let's first install Elixir and Erlang. You can find instructions in the [official installation guide](https://elixir-lang.org/install.html).

However, a fast way to install the language on `macOS` and `linux` is to use the [asdf](https://asdf-vm.com/) version manager:

```bash
# Install the elixir and erlang plugins
asdf plugin add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git

# Now install erlang
asdf install erlang latest

# And Elixir
asdf install elixir latest

# You can check that Elixir is installed with:
elixir -v
```

## Run the Code

If you want to run the following code yourself, there are three options:

1. Start an IEx REPL with `iex -S mix` and copy and paste the code into the command line.
2. Copy and paste the code into an Elixir script file, like `script.exs`, and run `mix run script.exs`.
3. **Recommended**: Install [Livebook](https://livebook.dev/) and simply click the `Run in Livebook` button above each file to open it in an interactive notebook.

## Let's begin!

Let's get started: [Learn how to write 'Hello World'](guides/01-basics/hello-world.livemd)