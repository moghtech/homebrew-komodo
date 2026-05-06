# Komodo Homebrew 🦎

This is a homebrew tap to install the [Komodo CLI](https://komo.do/docs/cli)
and [Komodo Periphery](https://komo.do/docs/connect-servers) on macOS (Apple silicon)
and Linux (x86_64 / aarch64).

Periphery can be used alongside [Docker Desktop](https://www.docker.com/products/docker-desktop),
[OrbStack](https://orbstack.dev), [Colima](https://github.com/abiosoft/colima), or other container runtimes.

## Add the homebrew tap

```sh
brew tap moghtech/komodo
```

## Install CLI

```sh
brew install moghtech/komodo/km
```

And configure your [`komodo.cli.toml`](https://github.com/moghtech/komodo/blob/main/config/komodo.cli.toml) at `$HOME/.config/komodo/komodo.cli.toml`.
For more information, see [the docs](https://komo.do/docs/cli#configure).

## Install Periphery

```sh
brew install moghtech/komodo/periphery && \
	brew services start periphery
```

### Relevant Paths
- periphery (binary)    -> `$(brew --prefix)/bin/periphery`
- periphery.config.toml -> `$(brew --prefix)/etc/komodo/periphery.config.toml`
- log                   -> `$(brew --prefix)/var/log/komodo/periphery.log`
