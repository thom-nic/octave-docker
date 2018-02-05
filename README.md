# Octave

Dockerized Octave, with X11 support. Specifically to support
[Coursera Machine Learning](https://www.coursera.org/learn/machine-learning/)

![Octave plot in X11](https://user-images.githubusercontent.com/95562/35827595-9e3b4102-0a8a-11e8-9981-2d39e38f777c.png)


## Changes from openmicroscopy/octave:

* Install from the octave PPA so we can run the latest (v4.2.1 @ at this time.)
  This is because v4 does not work with Coursera's `submit()` function.
* Some admin tools such as `curl`, `sudo` and `vim` are available.  In particular,
  `curl` is required for Coursera's Machine Learning class to submit exercises.
* `graphics_toolkit gnuplot` is set by default; this allows plots to work with 
  X11 as shown in the above image.
* Default entrypoint adds `--no-gui` so assume X11 is available but we want to 
  mostly use the CLI interpreter.
* The `octave` user is configured with `NOPASSWD` in `/etc/sudoers.d/octave`
* `history_file` ($OCTAVE_HISTFILE) is set to `/source/.octave_history` so your
  CLI history will be saved between invocations
* `WORKDIR` has been changed to `/source`

## Usage

To build:
```bash
docker build --compress -t thom_nic/octave:latest .

# To build with a different version of octave:
docker build --build-arg OCTAVE_VERSION=4.0.2 .

# You can also build locally without cloning this repo!!
docker build https://github.com/thom-nic/octave-docker.git#develop .
```

Running:
```bash
$ docker run --rm -it thom_nic/octave                                # Octave shell
$ docker run --rm -it --entrypoint bash thom_nic/octave              # Bash shell
$ docker run --rm thom_nic/octave -h                                 # Get octave help
$ docker run --rm thom_nic/octave /home/octave/example1.m arg1       # Run the example file
$ docker run --rm -v $(pwd):/source thom_nic/octave /source/myfile.m
```

Mount your local source folder to the container and run it inside the container.

From the octave CLI, you can also type `system 'bash'` to drop to a shell.

## Using X11 and Docker CE for MacOS

*There's a very long discussion [here](https://github.com/moby/moby/issues/8710)
however this is the easiest solution I've found:*

First, ensure remote access and auth are enabled:  Run XQuartz, open the prefs pane 
and ensure `Allow connections from network clients` is enabled.  If it was not,
you probably need to quit XQuartz after enabling that option.

Now, do the following:
```
open -a XQuartz
xhost + $(hostname)   # you must do this after starting xquartz!

# run your container:

docker run --rm -it \
  -e DISPLAY=$(hostname):0 \
  thom_nic/octave /home/octave/example3d.m
```

