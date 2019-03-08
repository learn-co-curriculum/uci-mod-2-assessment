# Password Generator Deliverable

## Background

On the modern web, protecting our private data is of critical importance, as
there are many nefarious parties interested in gaining access and using our
information for their own gain. The main defense we have against these threats
is to use secure and varied passwords for the many sites we use. Unfortunately,
many of us don't follow the best practices when it comes to coming up with
unique passwords.

For example, we use the same password on multiple sites, use simple passwords
so we won't forget them, or use passwords that reference personal information.
All three of these examples leave us prone to hacking. A hacker might be able
to crack a poorly secured website, get your account details and email, and then
test those out on other sites; they might just try to force their way in using
tables of common passwords; or, they could use your publicly available data
and/or social engineering tricks to find potential words you would use. Those
tagged photos you posted of you and Fluffy at the beach? Well, `fluffy`,
`fluffy123`, `F1uffy`, and every similar variation were just added to a list of
potential passwords for your account.

But we're savvy Ruby developers! From now on, all of our passwords are going to
be unique and hard to crack, right? No more birth dates or digits from our old
phone numbers, and definitely no mention of Fluffy. Instead, if we want to
maintain good security we should be coming up with long, complex, and seemingly
random passwords. In this lab, we'll be doing just that! Instead of having to
think up a long combination of characters, we can use Ruby to generate
them for us at will until we find one we like.

## Test Driven Application

This application will feature tests that you can run by using:

`rspec/password_generator_spec.rb`

Work to satisfy the tests.

## Specification

The tests will exercise that your application conforms to the following:

* `PasswordValidator` class must exist
  * It must be initialized with a `String`. Failure to initialize with a `String` triggers an error
  * It must also accept a second parameter, a `Number` which is the minimum
    length of the password. It should default to 8.

