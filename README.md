# webupdates: A web page update checker command

## Usage

### with Docker (recommended)

If you have Docker environment, easy to run `webupdates`:

```
$ docker run -it -v $PWD/data:/var/lib/webupdates nishidayuya/webupdates \
    data-name CSS-selector curl-options...
```

### without Docker

If you want to run `webupdates` directly, you must install following:

* [curl](https://curl.haxx.se/)
* [cssgrep](https://github.com/nono/cssgrep)
* [w3m](http://w3m.sourceforge.net/)

Copy `webupdates` command to `PATH` environment directory and set executable permission.

Enjoy `webupdates` command:

```
$ webupdates data-name CSS-selector curl-options
```

## Run periodically

We can run on Cron.

```
# In /etc/cron.d/webupdates

# Run webupdates at every 03:12.
12 3 * * * root docker run -it /var/lib/webupdates:/var/lib/webupdates nishidayuya/webupdates ...
```
