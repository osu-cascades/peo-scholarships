# Chapter FL, Oregon P.E.O. Scholarship Application System

The scholarship application system enables students to complete a scholarship
application, and for PEO chapter members to review the applications.

## Expectations

This is a Rails 5.x app with Ruby \~2.7, PostgreSQL, and AWS for storage.

## Development

There are a few steps to get up and running in development.

### Customize `.env`

* `RECAPTCHA_SITE_KEY`
* `RECAPTCHA_SECRET_KEY`
* `DATABASE_URL_DEV`
* `DATABASE_URL_TEST`

See _.env.example_ for a complete list of expected environment variables.

### Running the Application

After cloning this repository and `cd`ing into it, get up and running with:

`bundle install`
`rails db:setup`
`rails s`

### Create an initial User

To sign in to the app, you can create a user via /users/sign_up. However, this
user will have the `guest` role. To create an `admin` user, use the Rails
console:

```
User.create(first_name: 'Your', last_name: 'Name', email: 'you@domain.com', password: 'password', role: 'admin')
```

You should now be able to visit http://localhost:3000 and sign in with your
admin user credentials.

## Testing

This app is using minitest / Rails default tests. Run the suite with:

`rails test`

*Note*: There is a _Guardfile_ should you wish to use guard.

## Production

There is a staging and production environment hosted by Heroku.

```
heroku git:remote -a peo-scholarships-staging
git remote rename heroku staging
heroku git:remote -a peo-scholarships
git remote rename heroku production
```

By renaming the remotes, you can then deploy with

```
git push staging
git push production
```

Configure env vars in staging and production:

* `RECAPTCHA_SITE_KEY`
* `RECAPTCHA_SECRET_KEY`
* `AWS_S3_KEY`
* `AWS_S3_SECRET`
* `AWS_REGION`
* `AWS_S3_BUCKET`

*Note*: be sure to use different bucket names for staging and production.

You should create an initial User record for your admin user in both staging
and production:

```
heroku run rails c -rstaging
User.create(first_name: 'Your', last_name: 'Name', email: 'you@domain.com', password: 'password', role: 'admin')
```

And:

```
heroku run rails c -rproduction
User.create(first_name: 'Your', last_name: 'Name', email: 'you@domain.com', password: 'password', role: 'admin')
```

You should now be able to visit the staging and/or production URLs and sign in
with your admin user credentials.

&copy; 2020 Taylor Slye and Yong Joseph Bakos. All rights reserved.
