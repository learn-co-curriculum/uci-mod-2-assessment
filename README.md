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

Create a web page in `index.html` with the following characteristics:

* Validates with a W3C Validator
* Valid HTML 5 DOCTYPE
* Features a title
* Links to an external CSS sheet
* Create two sections
  * The first section should features a top-level header with the content: "Ruby"
    * It should _also_ feature a sub-heading (`h2`) with "A language for Joy"
  * The second section should features a top-level header with the content: "JavaScript"
    * It should _also_ feature a sub-heading (`h2`) with "A language for the Web"
* Each of the sections above should have a navigational area
  * The "Ruby" section's navigation should provide links to:
    * Ruby's Homepage (use this as the link body): `https://www.ruby-lang.org/en/`
    * Ruby's Documentation (use this as the link body): `https://www.ruby-lang.org/en/documentation/`
  * The "JavaScript" section's navigation should provide links to:
    * MDN: `https://developer.mozilla.org/en-US/docs/Web/JavaScript`
* Each `section` should have an identity attribute set to either `ruby` or
  `javascript` as appropriate to the `section`
* Write a short paragraph about yourself: Be sure to provide your name and the
  number of weeks you've been programming
  * Make your name bold
  * Make the number of weeks you've been programming italicized
* Create a unordered list of your three favorite things
  * Each item in the list should be of class-type `hobby`
* Include an image that you link to from the web
* Create a third section with id `guest-book`
  * Label a text field with "Guest Name:" text
  * Include a submit button
  * For the form `action`, point to `http://example.com/guest-list`
* Ensure the CSS specifies that the `id` of `guest-book` has a background-color
  of `smoke`
* Ensure the CSS document specifies that the `id` of `guest-book` has a background-color
  of `smoke`
* Ensure the CSS document specifies that the `class` of `hobby` has a
  foreground color of `#f442d9`

> **TIP**: During development you can use `ruby -run -e httpd . -p 5000` in the repo
> directory to run a local web server.  This should be sufficient to help you
> visually verify the function of this website by visiting http://localhost:5000.

## Proficiency 2: Procedural Programming in Ruby

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

## Conclusion

That's it! If you're reasonably comfortable with HTML authoring and Ruby
programming you'll have found this a simple task.
