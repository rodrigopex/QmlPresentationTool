import QtQuick 2.4
import QtQuick.Layouts 1.1

ColumnLayout {
    id: self
    anchors.fill: parent
    property alias source: image.source
    property alias caption: caption.text
    clip: true
    Item {
        Layout.fillHeight: true
    }
    Item {
        Layout.fillWidth: true
        Layout.preferredHeight: image.paintedHeight
        Image {
            id: image
            width: self.width
            height: self.height
            source: "qrc:/assets/images/qrcode.png"
            sourceSize: Qt.size(self.width*2, self.height*2)
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
    }
    Item {
        Layout.minimumHeight: parent.height * 0.10
        Layout.fillWidth: true
        Text {
            id: caption
            anchors.centerIn: parent
            width: parent.width
            height: parent.height
            horizontalAlignment: Text.Center
            wrapMode: Text.WordWrap
            color: "white"
            opacity: 0.7
            font {
                pixelSize: parent.height*0.4
            }
        }
    }
    Item {
        Layout.fillHeight: true
    }
}
