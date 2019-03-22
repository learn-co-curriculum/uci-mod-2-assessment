# UCI Extension Module 3 Entrance Exam

## Introduction

Welcome to this examination. It aims to assess your proficiency in the
following areas:

* Basic HTML site design
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

## Proficiency 1: Basic HTML Site Design

Disaster has struck! Our web site was not under Git protection and, in a
recent hard drive failure, has been lost.

Fortunately our IT team has been able to cobble the files back together, but
they're broken. Return the web site to normal function.

Also, the team was able to recover a series of tests that make sure the basic
function of the site is working. As you're building out the site, be sure to
run: `rspec spec/build-site_spec.rb`. This will ensure that you meet the basic
requirements.

During development you can use `ruby -run -e httpd . -p 5000` in the repo
directory to run a local web server.  This should be sufficient to help you
visually verify the function of this website.

## Proficiency 2: Procedural Programming in Ruby

* `PasswordValidator` class must exist
  * It features a class method called `safe?` that takes one required argument
    and one optional argument
    * required; 'a potential password'
    * optional; a minimum password length, should default to `8`
  * The `safe?` method should ensure that the potential password:
    * Contains at least 1 number
    * Contains at least 1 lower-case letter
    * Contains at least 1 upper-case letter
    * Contains one special character: `!#$%&()*+,-./:;<=>?@[]^_{|}~`
    * Has a length greater than the length parameter
  * The `safe?` method must make use of the following subroutines
    *  `self.has_one_lowercase?(potential_password)`
    *  `self.has_one_uppercase?(potential_password)`
    *  `self.has_one_number?(potential_password)`
    *  `self.has_one_special_character?(potential_password)`
    *  `self.is_long_enough?(potential_password, required_length)`

## Conclusion

Through these two mini-projects you should have demonstrated a basic HTML site
as well as a basic ability to write procedural Ruby code.
