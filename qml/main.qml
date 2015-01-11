import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

import "presentation"

ApplicationWindow {
    id: win
    visible: true
    width: 640
    height: 480
    title: qsTr("Qt Mobile 101")

    OpacityTransitionPresentation {
        anchors.fill: parent
        SlideCounter {}
        Clock {}
        Slide {
            centeredText: "Qt Mobile 101"
        }
        Slide {
            title: "Code editor inside presentation"
            CodeEditor {
                anchors.fill: parent
            }
        }
        Slide {
            title: "Bullets"
            content: [
                "Toplevel element",
                " <s>Defines background</s>",
                "  <i>Foreground color</i>",
            ]
            SideImage {
                source: "qrc:/assets/images/mexico.jpg"
                caption: qsTr("Punta Conejo - Salina Cruz 2014")
            }
        }
        Slide {
            title: "Image"
            FullImage {
                source: "qrc:/assets/images/mexico.jpg"
                caption: qsTr("México - Salina Cruz 2014")
            }
        }

        Slide {
            title: "Bullets"
            VideoTest {

            }
        }
    }
}
