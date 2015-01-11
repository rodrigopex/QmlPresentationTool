import QtQuick 2.3
import QtMultimedia 5.0

Rectangle {
    color: "#000000"
    anchors.fill: parent
    MediaPlayer {
        id: mediaplayer
        volume: 1.0
        muted: false
        //source: "file:///Users/rodrigopex/Tools/adt-bundle-mac-x86_64-20131030/sdk/samples/android-20/legacy/ApiDemos/res/raw/videoviewdemo.mp4"
//        source: "http://186.204.140.90:9000/videoviewdemo.mp4"
//        source: "http://download.wavetlan.com/SVV/Media/HTTP/MP4/ConvertedFiles/QuickTime/QuickTime_test2_5m19s_AVC_VBR_131bkps_176x144_24fps_AAC-LCv4_CBR_64kbps_Mono_48000Hz.mp4"
//        source: "http://download.wavetlan.com/SVV/Media/HTTP/H264/Talkinghead_Media/H264_test1_Talkinghead_mp4_480x360.mp4"
        source: "http://techslides.com/demos/sample-videos/small.mp4"
    }
    VideoOutput {
        anchors.fill: parent
        source: mediaplayer
        clip: true
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            mediaplayer.play()
            console.log("play!")
        }
    }
}
