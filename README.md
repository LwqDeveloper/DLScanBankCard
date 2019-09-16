1.CardIO文件夹拖进项目
2.TARGETS---Build Phases---Link Binary With Libraries，分别加入
    Accelerate.framework
    MobileCoreServices.framework
    CoreMedia.framework
    AudioToolbox.framework
    AVFoundation.framework
3.TARGETS---Build Settings---Other Linker Flags，分别加入
    -ObjC
    -lc++
