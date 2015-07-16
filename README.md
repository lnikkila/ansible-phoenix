# Phoenix role for Ansible [![Build status][circleci-badge]][circleci]

This role aims to be as lightweight as possible, providing you with
Phoenix-specific tasks only.

It’s simple enough to be used in either development or production with the
proper configuration. Try it with Vagrant!

For better flexibility, you’re expected to handle these prerequisites yourself:

- Elixir
- Node.js (if using Brunch)
- PostgreSQL
- Fetching the code for your application

See the [example playbook][playbook] for a recommended way to handle these.

In case you’re looking for a role that does more for you, check out
[jacoelho.phoenix-app][jacoelho.phoenix-app].

### Installation

The role is available through [Ansible Galaxy][galaxy].

Add to your requirements.yml:

```yaml
- src: lnikkila.phoenix
```

### Usage

Include the role in your playbook:

```yaml
- role: lnikkila.phoenix
```

There’s no need to run the entire role as root. The tasks that require it are
configured separately to use `become`.

The role exposes a few variables for configuration. The defaults should be
mostly sensible:

```yaml
# Whether to run a Brunch build and Ecto migrations.
# NOTE: Using Brunch requires Node.js.
phoenix_use_brunch: true
phoenix_use_ecto:   true

# Mix environment (propagates to Phoenix.)
phoenix_env: prod

# Server port.
phoenix_port: 4000

# Extra environment variables you want passed to Phoenix. Feel free to add your
# secret keys and such.
phoenix_env_vars: {}

# Path to the app.
phoenix_path: /var/www

# User for running the server.
phoenix_user:  phoenix
phoenix_group: phoenix

# Whether to create a system user. System users have the system flag set to true
# and have a home directory at {{ phoenix_path }}.
#
# Set this to false if you want to use an existing user. The system flag cannot
# be changed after a user has been created.
#
# Disable this also if you're running Vagrant and have Phoenix at /vagrant.
# The shared directory cannot host executables. That will cause problems with
# Mix as it installs dependencies there.
phoenix_system_user: false

# Command for running the server.
phoenix_bin: mix phoenix.server
```

### Licence

```
Copyright (c) 2015, Leo Nikkilä

Permission to use, copy, modify, and/or distribute this software for any purpose
with or without fee is hereby granted, provided that the above copyright notice
and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS
OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF
THIS SOFTWARE.
```

[circleci-badge]: https://img.shields.io/circleci/project/lnikkila/ansible-phoenix.svg
[circleci]: https://circleci.com/gh/lnikkila/ansible-phoenix
[galaxy]: https://galaxy.ansible.com/list#/roles/4385
[playbook]: /spec/support/playbook.yml
[jacoelho.phoenix-app]: https://github.com/jacoelho/ansible-phoenix-app
