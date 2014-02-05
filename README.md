# BEAM Toolbox

The goal of the BEAM Toolbox is to provide a community-curated list of packages
for BEAM-based languages.  It does not intend to supplant [expm](http://expm.co)
or any other tools for package management; rather, it aims to become the place
to find packages to help in a given area if developing on the BEAM.

Also, it will highlight *projects* rather than simply packages.  In this way, it
can accomodate open source projects (wikis, blog engines, etc.) that aren't
meant to be used as libraries, as well.

## Desired Features

The overarching goal is to develop something similar to [Ruby
Toolbox](http://ruby-toolbox.com) for BEAM languages (Erlang, Elixir, Joxa, LFE,
etc).  Here is a first-pass at elucidating the desired features in the first
'release'.

- High level data model
  - Category Groups
  - Categories (each belongs to one group)
  - Projects (each belongs to one category)
- Site structure
  - Categories
    - By group, alphabetically (default)
    - By name, alphabetically
  - Projects
    - By name, alphabetically

Initially, this data will be seeded with static files maintained in the git
repository.  Updates would happen via Pull Requests.  After the data model
solidifies a bit, I would anticipate building out a database with some end-user
modifiable fields.

## Build out

I intend to build this out in a series of ElixirSips episodes, entirely in the
open.  I welcome suggestions on the data model ahead of time, but I do intend to
start this week (it is 2014-02-04 as of this writing).

## Footnotes, etc.

The BEAM Toolbox is brought to you by Josh Adams of
[ElixirSips](http://www.elixirsips.com).  If you have suggestions, please send
them to **josh dot rubyist at gmail dot com**.  I'm also on
[Twitter](http://twitter.com/knewter) and [GitHub](http://github.com/knewter).

Massive thanks to everyone on the mailing list and IRC for support and
suggestions.

## License

This project is shared under the [MIT License](/LICENSE).
