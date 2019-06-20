# UCI Module 2 Assessment

## Introduction

Welcome to this examination. It aims to assess your proficiency in the
following areas:

* Procedural programming in Ruby
* Unix / Git / RSpec fundamentals

## Implementation

All work should be in this repository. When you are done, commit _all your
files_ to the repository and _push_ the repository to GitHub. The repository
should be public (and therefore free of charge). Provide the repository path to
UCI and we will run tests to verify your proficiency.

## Technical Requirements

To retrieve the content you will need to have `git` installed.

You will need to have the `ruby` program and the `bundler` gem installed.

After cloning the repo to your local machine, run `bundle install` and ensure
that your application works.

## Procedural Programming in Ruby

We'll be creating a password strength validator. Create the following methods
at the top-level scope. Do not embed them within a `class`. All parameters are
required for the following methods.

* Specific criterion methods
  *  `has_one_lowercase?(potential_password)`
  *  `has_one_uppercase?(potential_password)`
  *  `has_one_number?(potential_password)`
  *  `has_one_special_character?(potential_password)`
  *  `is_long_enough?(potential_password, required_length)`
* Write a method called `safe?` that takes one required argument and one optional argument
  * Method parameters
    * **required**; 'a potential password'
    * **optional**; a minimum password length, should default to `8`
  * The implementation should ensure that the potential password:
    * contains at least 1 number by calling `has_one_number?`
    * contains at least 1 lower-case letter by calling `has_one_lowercase?`
    * contains at least 1 upper-case letter by calling `has_one_uppercase?`
    * contains one special character: `!#$%&()*+,-./:;<=>?@[]^_{|}~` by calling `has_one_special_character?`
    * has a length greater than the length parameter, the second argument, by calling `is_long_enough?`

* If all conditions are satisfied, return `true`; else, return `false`.
