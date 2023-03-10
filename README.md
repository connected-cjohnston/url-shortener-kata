# URL Shortener Kata

## Purpose

Demonstrate benefits of dependency injection, doubles and spies

## Setup

### 1. Prerequisites

1. Install rbenv (Ruby version manager) using [rbenv-installer](https://github.com/rbenv/rbenv-installer) (follow link for instructions).
    - Run `rbenv init` and follow the instructions to configure your shell
1. Install Ruby: `rbenv install 3.2.0`.
1. Install bundler: `gem install bundler`.
1. Install dependencies for auto-running tests: `brew install ag entr`

### 2. Environment setup

1. Clone repo
```
git clone git@github.com:connected-psobocinski/url-shortener-kata.git
```

2. Install dependencies
```
bundle install
```

3. Open working directory in your IDE of choice
```
code . # vs code
```

## Usage

### Run tests

```
# Auto-run rspec tests
./rspec_autorun.sh
```

## Tools

### Interactive Ruby

Run ruby code in terminal:
```
irb
```

## Kata Description

You have inherited a `URLShortener`. Two public methods exist on the class:

1. `URLShortener.new.shorten(long_url)`
    - Given a new full-length URL, it generates a shortened version of the URL and stores it in the DB
    - Given an existing full-length URL, it retrieves the shortened version of the URL from the DB
2. `URLShortener.new.retrieve(short_url)`
    - Given an existing shortened URL, retrieves the full-length URL from the DB
    - Given a non-existent shortened URL, raises a "not found" error

There is a failing test that needs to be fix.

The goal of this kata is to introduce doubles and spies using Dependency Inversion. This is an exercise in refactoring and isolating the method under test from its dependencies.
