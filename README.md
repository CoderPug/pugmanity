# Pugmanity

A simple vapor demo project used for this [meetup](https://www.meetup.com/Tech-Meetup-Santex-Cordoba-Argentina/events/235573588/) @SantexGroup in Córdoba, Argentina. Slides available [here](https://speakerdeck.com/coderpug/server-side-development-with-swift) and [here](http://slides.com/josetorrescardenas/deck-6#/)

##About

//TBD

##Setup

For running the project locally :

If you have not installed Vapor yet, do install Vapor following these [instructions](https://vapor.github.io/documentation/getting-started/install-toolbox.html)

After that, install MySQL. Here are the [instructions for macOS or Linux](https://github.com/vapor/mysql)

Now you will have to configure your database connection as described below

##Configuration

Inside the project, update your MySQL connection information located in Config/secrets/mysql.json

Example of mysql.json :
```
{
  "host": "z99a0.asdf8c8cx.us-east-1.rds.amazonaws.com",
  "user": "username",
  "password": "badpassword",
  "database": "databasename",
  "port": "3306",
  "encoding": "utf8"
}
```

Finally run the project from terminal with 

- `vapor build`
- `vapor run`

or open it on Xcode with `vapor xcode` and run it.

##References

- [Vapor web framework](https://github.com/vapor/vapor)
- [Default gallery theme](https://github.com/xremix/xGallerify)
- [Gallery B theme](https://github.com/codrops/ScatteredPolaroidsGallery)

##Captures
![screencapture1](http://i.imgur.com/wuKyPvg.png)
![screencapture2](http://i.imgur.com/QsDV1yy.png)


