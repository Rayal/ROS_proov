# ROS_proov
My various trials and failures in ROS Kinetic

## Description:
So here's the long and the short. I can be a bit long winded, but since this is MY repo, I am allowing myself the pleasure.

So the main reason I have this repo is that I wanted to try out for a Robotics company, and needed a repo to hold the code. And as I needed a ROS trial repo anyway, I merged the thing.

What follows is a description of how I handled the trial for The Company (They know themselves and I'm not affiliated with them YET, so they are The Company. Gives them kind of like a part military tech feel, which I think is fitting...)
Anywho! **I was to find some robot capable of propelling itsself, attach a camera and implement some visual odometry algorithm.**

I broke this into the following parts:

### Setup
The Company uses ROS Kinetic Kame and Gazebo 8 for their work. As such, I felt it would be useful to install the stuff. Which is fairly simple, except for the Gazebo 8 part. Kinetic comes with Gazebo 7 and quite a few of the packages use Gazebo 8.  
I had some issues with turtlebot and Gazebo 8 that I tried fixing for about hald a day. This I felt was a waste of my time, especially given that I was on a deadline. So I tried the same code on Indigo, with whatever Gazebo version that has (I think it was V2...). This worked, and it worked with Gazebo 7, so I decided that it should, for the most part, work with Gazebo 8.

### Getting a Robot
This is an important, though quite trivial, part. I used the material from the ROS indigo tutorials
(http://wiki.ros.org/turtlebot_gazebo/Tutorials/indigo/Gazebo%20Bringup%20Guide)  
I took apart the launch file *turtlebot_world.launch*, to see how precisely to spawn a robot and create a world more interesting than the empty one. This is latter is important because visual odometry prefers unique objects in the frame (unless I am very mistaken...). My canibalized version of the turtlebot launch files can by found from the *my_turtlebot* pachage in the catkin workspace (https://github.com/Rayal/ROS_proov/tree/master/catkin_ws/src/my_turtlebot/launch).

## Getting the Robot to Move
This was harder than I expected. While Gazebo 8 happily spawned the world and the robot within it, I couldn't get the Kobuki machine to move, no matter how many times I turned it off and on. This was especially frustrating as all tutorials(http://wiki.ros.org/turtlebot_gazebo/Tutorials/indigo/Explore%20the%20Gazebo%20world) and forums and stuff showed it to be a fairly simple step: spawn the world, launch some teleop file, profit. This was when I gave up on Gazebo 8 and tried out the code in Indigo, and later on vanilla Kinetic (that means without Gazebo 8). To be honest, I'm not sure it was a problem with Gazebo, rather a SNAFU on my part with the setup. The Gazebo world didn't subscribe to the robot command topic, through which movement commands were being broadcast. Either way, after a half a night's worth of time spent looking in depth at how topics were subscribed and published to, I moved on with my life.

## Putting a Camera on the Robot
I've never done something like this before. And I kinda cheated. the Turtlebot package already has a mostly functional Kinect attached to the base. But as I wanted to do things the hard way, I first had a look at how to make my own camera. Saw how it worked(http://gazebosim.org/tutorials?tut=ros_gzplugins#Camera), saw that it was all done in the turtlebot launch files and used the turtle launch files. I was really surprised at the ease at which it all worked. My computer was surprised at the amount of computations it had had to handle in one sitting.

## Implementing an Odometry Algorithm
This could be considered the final leg. Google promptly gave me a likely candidate in the form of viso2 (http://wiki.ros.org/viso2_ros). It took me some time to read through the wiki page. I felt it to be mildly annoying that there wasn't a lot of example code, but I guess that would have been far too easy. I got the impression that it would be a food idea to use the *image_proc* package to process the image before feeding it into the odometry package. I plugged in all the topics and presto! Numbers came out.

The numbers were pretty. They changed as the robot moved and didn't change while the robot was still. But they didn't make any sense to me. I changed some topics, turned off the *image_proc* package, basically tried all the buttons, so to speak, but it didn't work as I expected. Looking at the odometry with the Odometry markers in RVIZ, I got the impression that the odometry was being calculated using the wrong frame of reference. I'm not sure what the correct reference is, though. Given more time I'll look further into it and hopefully get it working, but the deadline from The Company struck (that's why the tone suddenly changed).

## The Conclusion and Consolation
All in all, an interesting failure. There's nothing like a nice failure in a trial excercise to put into perspective that I still have a long way to go.

Among the things that I learned was how to have Gazebo make the little cute red box I Duct Taped to the Robot (URDF-ly speaking) act as the most accurate camera in the world. I'm sure it will come in handy fairly soon.  
I also learned that I have a lot of learning to do to be able to better cannibalize launchfiles, but that the progress so far is acceptable.

I also looked into a few other odometry algorithms:
* http://wiki.ros.org/fovis_ros
* http://www.ros.org/news/2014/06/new-package-svo-semi-direct-monocular-visual-odometry.html

While I didn't get any of them working, I was able to get the second compiled. It didn't like the images from the Kinect; I think it was in the wrong format.

# Licence
I, Andreas Ragen Ayal, hereby licence this repository under the MIT Licence. The short of it is as follows:  
**Take and use this code as you see fit (preferably for good). Don't come crying to me if it doesn't work, though. ;)**


