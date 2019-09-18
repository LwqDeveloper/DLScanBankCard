## DLScanCardDemo_Card
### 1.CardIO文件夹拖进项目
### 2.TARGETS---Build Phases---Link Binary With Libraries，分别加入
    * Accelerate.framework
    * MobileCoreServices.framework
    * CoreMedia.framework
    * AudioToolbox.framework
    * AVFoundation.framework
### 3.TARGETS---Build Settings---Other Linker Flags，分别加入
    * -ObjC
    * -lc++
    
    
## DLScanCardDemo_FBY
### 1.文件夹bank_card，BankData复制到工程
### 2. TARGETS--Build Settings，搜索enable bitcode 设置为NO。
### 3. xcode8上边编译可能会遇到arm64错误， TARGETS--Build Settings，搜索Enable Testability 设置为NO。
