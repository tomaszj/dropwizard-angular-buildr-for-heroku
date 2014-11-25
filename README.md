# dropwizard-angular-buildr-for-heroku

A sample, fairly bare-bones setup for Dropwizard API which serves necessary files for a frontend application. Built using buildr.

# Building locally

run `buildr package` and then `java -jar target/dropwizard-angular-buildr-for-heroku-0.1.0.jar server server.conf` or use `run_api.sh` file, which does exactly the same thing.

# Interesting bits

All static assets are served from src/main/resources/static folder through Dropwizard's AssetsBundle servlet.

I spent most time getting the server.conf to play well with Procfile used by Heroku.

Second interesting bit is the [AssetsServingFilter class](https://github.com/tomaszj/dropwizard-angular-sbt-for-heroku/blob/master/src/main/java/org/tomaszjaneczko/testpoc/api/AssetsServingFilter.java)
 which essentially handles the redirection of all user's requests to serve index.html page, excluding JS, CSS files and images.
 The purpose is to support HTML5 mode paths in Angular application. This way, http://secure-hamlet-8382.herokuapp.com/businesses
 link is resolved properly to Angular application, while preserving the path for correct resolution.

Servlet filter is used, as Dropwizard uses a separate servlet to handle static files, bypassing resolution used for normal Resources.

`system.properties` file is used by Heroku to install correct Java runtime version. In this case it's Java 8.

# License

Standard MIT.
