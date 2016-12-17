# Moka Rails Interview Project

Thank you for your interest in joining Moka Engineering team. We're excited that you're considering to join our awesome team!

This Rails project is a simple version of Moka:
- There are User
- User has a Business
- Business has list of Items
- User can Create/Update/Delete the Items in the Business

## TO DO's

Please add the following functionalities to the project:

1. [MOKA-001] Finish the implementation of Create/Update/Delete for Items
2. [MOKA-002] Finish the implementation of User registration
3. [MOKA-003][Extra Credit] Improve the simple Authorization model

Then you will need to create a pull request against the `master`, with a title of the problem that you chose.

*Please make sure that you also include the unit tests for the models and controllers, and properly document your codes.*

## How to Setup

1. `bundle install`
2. `rake db:migrate`
2. `rake db:seed`
3. `rails s`

## Credentials

```
Username: john@moka.com, Password: 000000
Username: jane@moka.com, Password: 111111
```

## Databases

```
List of relations
Schema |       Name        | Type  |  Owner
--------+-------------------+-------+----------
public | businesses        | table | postgres
public | items             | table | postgres
public | schema_migrations | table | postgres
public | users             | table | postgres
```
