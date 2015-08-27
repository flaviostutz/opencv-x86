FROM ubuntu:14.04

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty multiverse" >> /etc/apt/sources.list \
     && apt-get update \
     && apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip ssh

RUN wget https://github.com/Itseez/opencv/archive/3.0.0.zip \
     && unzip 3.0.0.zip \
     && cd opencv-3.0.0 \
     && mkdir release \
     && cd release \
     && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D INSTALL_C_EXAMPLES=ON -D INSTALL_PYTHON_EXAMPLES=ON -D BUILD_EXAMPLES=ON -D WITH_QT=ON -D WITH_OPENGL=ON .. \
     && make -j4 \
     && make install \
     && bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf' \
     && ldconfig

CMD ["service ssh start"]

EXPOSE 22
