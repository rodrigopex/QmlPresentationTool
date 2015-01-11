import QtQuick 2.4

Rectangle {
    width: parent.width; height: parent.height
    color: "lightgreen"
	Text {
		id: displayWidth
		font.pixelSize: parent.height*0.1
		text: parent.parent.parent.width
	}
	Text {
	    id: separator
		text: "x"
		font.pixelSize: parent.height*0.1
		x:  displayWidth.width
	}
	Text {
		id: displayHeight
		opacity: 0.5
		x:  separator.x + separator.width
		font.pixelSize: parent.height*0.1
		text: parent.parent.height
	}
}