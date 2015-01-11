import QtQuick 2.4
import QtQuick.Layouts 1.1

Item {
    property alias source: internalImage.source
    property alias caption: internalImage.caption
    anchors.right: parent.right
    height: parent.height
    width: parent.width/2
    clip: true
    FullImage {
        id: internalImage
    }
}
