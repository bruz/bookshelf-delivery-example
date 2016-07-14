This is an extension of the Bookshelf app featured in [Hanami's Getting Started Guide](http://hanamirb.org/guides/getting-started/), mainly as an exploration of taking an app's use cases and providing multiple delivery mechanisms around them: a browser UI, an API, and a command line interface. It's the first thing I've done with Hanami, so feedback on anything that doesn't seem to fit with the Hanami way of doing things will be happily received.

# Current status

[![Travis](https://img.shields.io/travis/bruz/bookshelf-delivery-example.svg?style=flat-square)](https://travis-ci.org/bruz/bookshelf-delivery-example) [![Gemnasium](https://img.shields.io/gemnasium/bruz/bookshelf-delivery-example.svg?style=flat-square)](https://gemnasium.com/bruz/bookshelf-delivery-example) [![Code Climate](https://img.shields.io/codeclimate/github/bruz/bookshelf-delivery-example.svg?style=flat-square)](https://codeclimate.com/github/bruz/bookshelf-delivery-example)

# Getting started

Prerequisites:

 * Ruby 2.2 or 2.3
 * PostgreSQL

Setup:

    git clone https://github.com/bruz/bookshelf-delivery-example.git
    cd bruz/bookshelf-delivery-example
    hanami db create
    hanami db migrate

Using the CLI (doesn't require a running server):

    ./bin/bookshelf add "Hard-Boiled Wonderland and the End of the World" "Haruki Murakami"

Starting the server:

    hanami server

The web UI will now be available at to browse at [http://localhost:2300](http://localhost:2300).

The REST-like API lives under /api/books, so for example you can do:

    curl http://localhost:2300/api/books -X POST -d 'title=The Count of Monte Cristo&author=Alexander Dumas'

# License

This project is licensed under the [MIT Licence](https://github.com/bruz/bookshelf-delivery-example/blob/master/LICENSE).
