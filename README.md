# Chapter FL, Oregon P.E.O. Scholarship Application System

The scholarship application system enables students to complete a scholarship
application, and for PEO chapter members to review the applications.

## Expectations

This is a Rails application that relies on an Postgres database and S3.

## Development

Clone the repo, `cd` into the directory, and install the dependencies with
`bundle install`. Bootstrap the databases with `rails db:setup`. Run with
`rails server`.

## Customize `.env`

* `RECAPTCHA_SITE_KEY`
* `RECAPTCHA_SECRET_KEY`
* TODO

## Testing

Using minitest and the Rails test machinery for testing. Run the suite with
`rails test`.

## Production Notes

Configure env vars:

* `RECAPTCHA_SITE_KEY`
* `RECAPTCHA_SECRET_KEY`
* `AWS_S3_KEY`
* `AWS_S3_SECRET`
* `AWS_REGION`
* `AWS_S3_BUCKET`

&copy; 2020 Taylor Slye and Yong Joseph Bakos. All rights reserved.
