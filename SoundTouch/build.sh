#!/bin/bash
LIBNAME=libSoundTouch.a
PWD = 'pwd'
echo $PWD
xcodebuild clean  -project $1
xcodebuild -configuration Release -sdk iphonesimulator -arch i386  -project $1
mv $PWD/build/Release-iphonesimulator/$LIBNAME  $PWD/i386.a
 
 
xcodebuild clean  -project $1
xcodebuild -configuration Release -sdk iphonesimulator -arch x86_64   -project $1
mv $PWD/build/Release-iphonesimulator/$LIBNAME  $PWD/x86.a
 
xcodebuild clean  -project $1
xcodebuild -configuration Release -sdk iphoneos  -arch armv7    -project $1
mv $PWD/build/Release-iphoneos/$LIBNAME $PWD/v7.a
 
xcodebuild clean  -project $1
xcodebuild -configuration Release -sdk iphoneos  -arch armv7s  -project $1
mv $PWD/build/Release-iphoneos/$LIBNAME  $PWD/v7s.a
 
xcodebuild clean  -project $1
xcodebuild -configuration Release -sdk iphoneos  -arch arm64  -project $1
mv $PWD/build/Release-iphoneos/$LIBNAME  $PWD/v64.a
 
lipo -output $LIBNAME -create i386.a x86.a  v7.a  v7s.a  v64.a
rm i386.a x86.a  v7.a  v7s.a  v64.a

