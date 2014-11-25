#!/usr/bin/env bash

buildr package
java -jar target/dropwizard-angular-buildr-for-heroku-0.1.0.jar server server.conf

