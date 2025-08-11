# Komodo Homebrew 🦎

This is a homebrew tap to install the [Komodo CLI](https://komo.do/docs/cli)
and [Komodo Periphery](https://komo.do/docs/connect-servers) on *Apple silicon* based Macs.

Periphery can be used alongside [Docker Desktop](https://www.docker.com/products/docker-desktop),
[OrbStack](https://orbstack.dev), [Colima](https://github.com/abiosoft/colima), or other Docker-on-Mac tools.

Non-Apple silicon Macs can install this, and replace the binary (`/opt/homebrew/bin/periphery`) with one built [from source](https://github.com/moghtech/komodo) on their machine.

## Add the homebrew tap

```sh
brew tap moghtech/komodo
```

## Install CLI

```sh
brew install km
```

And configure your [`komodo.cli.toml`](https://github.com/moghtech/komodo/blob/main/config/komodo.cli.toml) at `$HOME/.config/komodo/komodo.cli.toml`.
For more information, see [the docs](https://komo.do/docs/cli#configure).

## Install Periphery

```sh
brew install periphery && \
	brew services start periphery
```

### Relevant Paths
- periphery (binary)    -> `/opt/homebrew/bin/periphery`
- periphery.config.toml -> `/opt/homebrew/etc/komodo/periphery.config.toml`
- log                   -> `/opt/homebrew/var/log/komodo/periphery.log`
- stack directory       -> `/opt/homebrew/var/komodo/stacks/`
- repo directory        -> `/opt/homebrew/var/komodo/repos/`