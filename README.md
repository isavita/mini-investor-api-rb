# Mini Investor Api

## Local setup
### Install postgresql

  * [on mac](https://www.codementor.io/engineerapart/getting-started-with-postgresql-on-mac-osx-are8jcopb)
  * [on ubuntu](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-18-04)
  * [on windows](http://www.postgresqltutorial.com/install-postgresql)

### To start your Rails server:

  * Install dependencies with `bundle install`
  * Create and migrate your database with `rails db:setup`
  * Start rails server on the correct port with `rails server -p 4000`

### To start your web app

  * Clone the [web app repository](https://github.com/isavita/mini-investor-ui)
  * Follow the README of the repository to setup the project

## Docker setup (with Makefile)
  * For initial setup (creates the database and runs the seed) run
  ```shell
  make setup
  ```
  * For rebuild run
  ```shell
  make dev
  ```

  Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.

## Project design (project is split into two repositories)
### JSON API in Ruby (current one) - Simple API that provides following

  * `GET /api/campaigns` - Suppor page based pagination with `page` and `pageSize` params.
  * `GET /api/campaigns/:id` - Gets single campaign.
  * `POST /api/investments` - Creates a new investment for given campaign.

---

  * POST of investment endpoint has validation that the `investment amoun` is multiple of `campaign multiplier amount`
    and it is positive.
  * POST has lock to prevent of lose of investment due to concurrency issues (e.g. two users invest at the
    same time for the same campaign, but the second processed investment amount overwrites the first).

### Web client in Vue - more info [here](https://github.com/isavita/mini-investor-ui)
### Alternative JSON API in Elixir ([here](https://github.com/isavita/mini-investor-ex))

## Design flaws/Missing elements

  * Pagination assumes that there is no high rate of creation of new campaigns. For instance, if there was a case in
    which 50 new campaign are created per second the pagination would move to much and then [cursor base pagination](https://github.com/gocardless/http-api-design/blob/master/README.md#pagination)
    would be better.
  * Idempotent key - `Not Implemented`
  * Rate limiter - `Not Implemented`
  * Permissions - `Not Implemented`
  * Form validation - `Not Implemented` (Only basic with validator in CreateInvestment unit)

