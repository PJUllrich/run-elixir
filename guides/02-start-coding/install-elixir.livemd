# Install Elixir

You can find installation instructions for Elixir and Erlang in the [official installation guide](https://elixir-lang.org/install.html).

However, a fast way to install the language on `macOS` and `linux` is to use the [asdf]() version manager:

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

And that's it! Let's see how to generate a project in the next chapter.


