# pygopherd-docker

Docker container for pygopherd. Ever want to run a gopher server but run a modern computer? Now you have no excuses!

## Usage

Run the container as follows:

```
docker run --name pygopherd \
	-p 70:70 \
	-e PYGOPHERD_HOSTNAME="kale.zone" \
	-v /var/www/gopher:/opt/gopher \
	-d kalemeow/pygopherd
```

TCP/70 is the gopher protocol; pygopherd is a smart cookie in that if it receives HTTP requests over port 70, it'll respond to your WWW browser with an HTML version of the gopherspace.  Naturally, gopher-protocol requests made to port 70 will recieve pure gopher.

The environment variable PYGOPHERD_HOSTNAME should be set to the external hostname of your host; this is for rendering internal links within the gopherspace.

Replace `/var/www/gopher` with the path to the directory you want to serve as the root of your gopherspace.  There are no built-in access controls; everything in that path will be accessible publicly.

## Why?

Well, why not?

