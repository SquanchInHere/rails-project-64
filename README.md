### Hexlet tests and linter status:
[![Actions Status](https://github.com/SquanchInHere/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/SquanchInHere/rails-project-64/actions)
[![Actions Status](https://github.com/SquanchInHere/rails-project-64/actions/workflows/ci.yml/badge.svg)](https://github.com/SquanchInHere/rails-project-64/actions)

## The project is located at the [demo link](https://hexlet-blog-learn.onrender.com).
## The example project is located at the [demo link](https://rails-collective-blog-ru.hexlet.app/).

# Project "Collective Blog"
The project is a board of posts created by site users. Under posts, users can leave their comments (in the form of a "tree" to a certain depth) and like the post. Both logged in and non-logged in users can view posts. Site users can register and log into the site under their account. Logged in users can create posts, write comments under posts, and write comments on already created comments.

# Technical description and requirements for project implementation
 - ruby --version # => 3.2.2
 - rails --version # => 7.1.3

## Launch of the project
    make install
    make yarn_install
    make db_migrate
    make db_seed
    make compile_assets
    rails s

## Decor
 - In the README.md file there is a GitHub Actions badge with the status of passing tests and linter
 - The README.md file contains links to the demo project

## Tests
 - Minitest and power assert are used
 - Faker is used to generate test data 
## Naming
 - Nested resources are prefixed with the name of the main entity
 - Controllers and communications do not contain a prefix
## Code
 - CRUDs are built through resource routing
 - All links (in templates and controllers) are built only through named routing
 - All interface texts are located in locale files
 - The Slim template engine is used for views
 - Only standard Bootstrap mechanisms are used
