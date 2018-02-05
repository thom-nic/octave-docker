% This is a simple example that will create a 3d plot which you can use to
% test if X11 is working correctly.  Run from your docker container like this:
% docker run --rm -it  -e DISPLAY=$(hostname):0 thom_nic/octave /home/octave/example3d.m
% Note
x=linspace(-2,2,50);
y=linspace(-2,2,50);
[xx,yy]=meshgrid(x,y);
meshc(xx,yy,4-(xx.^2+yy.^2))
pause;
