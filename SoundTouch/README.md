https://blog.csdn.net/c553110519/article/details/72677175

xcode soundtouch 一次编译armv7 armv7s arm64 i386 i64 库

下载soundtouch 源码 http://www.surina.net/soundtouch/soundtouch-1.9.2.tar.gz

再xcode下新建soundtouch 工程 选择创建工程类型

添加文件的时候切记soundtouch的配置头文件 #define SOUNDTOUCH_INTEGER_SAMPLES      1 不要使用默认的FLOAT的这个是32位的，选择错了有可能会造成你生成出来的是噪音

4，选择真机进行编译库，看是否正常编译 结果编译征程

5，再soundtouch平级目下创建编译脚本build.sh touch build.sh

6,设置可执行权限 sudo chmod 777 build.sh

7，编辑内容 #!/bin/bash LIBNAME=libSoundTouch.a PWD = 'pwd' echo $PWD xcodebuild clean -project $1 xcodebuild -configuration Release -sdk iphonesimulator -arch i386 -project $1 mv $PWD/build/Release-iphonesimulator/$LIBNAME $PWD/i386.a

xcodebuild clean -project $1 xcodebuild -configuration Release -sdk iphonesimulator -arch x86_64 -project $1 mv $PWD/build/Release-iphonesimulator/$LIBNAME $PWD/x86.a

xcodebuild clean -project $1 xcodebuild -configuration Release -sdk iphoneos -arch armv7 -project $1 mv $PWD/build/Release-iphoneos/$LIBNAME $PWD/v7.a

xcodebuild clean -project $1 xcodebuild -configuration Release -sdk iphoneos -arch armv7s -project $1 mv $PWD/build/Release-iphoneos/$LIBNAME $PWD/v7s.a

xcodebuild clean -project $1 xcodebuild -configuration Release -sdk iphoneos -arch arm64 -project $1 mv $PWD/build/Release-iphoneos/$LIBNAME $PWD/v64.a

lipo -output $LIBNAME -create i386.a x86.a v7.a v7s.a v64.a rm i386.a x86.a v7.a v7s.a v64.a

8，使用终端，命令行上输入./build.sh soundtouch.xcodeproj

9, 这个编译脚本很容易即可移植其他工程，只需要换成其他工程的参数即可 ———————————————— 版权声明：本文为CSDN博主「程龙-音视频」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。 原文链接：https://blog.csdn.net/c553110519/article/details/72677175

