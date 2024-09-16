# Introduction

Keeping in-memory state is trivial in Elixir because its virtual machine, the BEAM, was designed to handle short-lived and ephemeral state without a database. We already looked at the [GenServer](04-async/genserver.livemd) which starts a process that has its own state, but Elixir has even more options to offer. Let's dive in.