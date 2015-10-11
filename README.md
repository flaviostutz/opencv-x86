# OpenCV 3 Container for x86

Container contents:
  * OpenCV 3.0.0
  * Python 2 and 3
  * SSH server prepared for login with user/password root/root
  * C/C++ compiler, CMake
  * Git

For accessing this container by SSH, with X-Window export, so that you can run applications that displays user interfaces, do:
  * Start X server on you machine
  * Start container with "docker run --name flaviostutz-opencv2 --privileged -p 2222:22 flaviostutz/opencv-x86"
  * If you need to stop/start SSH Server, run "docker exec flaviostutz-opencv2 service ssh restart"
  * From your machine, connect to the container using "ssh -X -p 2222 root@[CONTAINER HOST]"
  * On a SSH session, run an application, such as "[OpenCV]/facedetect.py --cascade cascade.xml". It will open your webcam and show its contents on a X-Window on your machine
  * Many times I use sshfs to mount a directory from the container on my local machine so that I can edit complex files using Atom and run it inside the container by simple commands on the SSH session (no need to sync or transfer files). In this scenario, I keep all the project files inside the container and push its contents through Git to the outside.
