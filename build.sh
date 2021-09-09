#!/bin/bash
DIST=focal
WORKDIR=google-chrome-stable
rm pkg2appimage-1807-x86_64.AppImage
wget https://github.com/AppImage/pkg2appimage/releases/download/continuous/pkg2appimage-1807-x86_64.AppImage
chmod 700 pkg2appimage-1807-x86_64.AppImage
rm -Rf $WORKDIR
rm -Rf google-chrome-stable_current_amd64.deb
rm -Rf out
rm google-chrome-latest.yml
cp google-chrome-latest.yml.template google-chrome-latest.yml
sed -i "s/DIST/$DIST/g" "google-chrome-latest.yml"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ./google-chrome-stable_current_amd64.deb
./pkg2appimage-1807-x86_64.AppImage google-chrome-latest.yml
