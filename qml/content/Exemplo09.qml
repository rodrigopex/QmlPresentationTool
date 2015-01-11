import QtQuick 2.4

Rectangle {
    anchors.fill: parent
    color: "gray"
	Rectangle {
    	anchors.fill: parent
    	anchors.margins: 20
		color: "green"		
		Rectangle {
			anchors.left: parent.left
			anchors.right: parent.right
			height: parent.height/2
			color: "lightblue"
			Rectangle {
				width: parent.width*0.16
				height: parent.height*0.3
				x: 80; y:90
			}
		}
		Rectangle {
		    id: p
		    width: parent.width*0.16
			height: parent.height*0.16
			x: 180; y:400
			color: "blue"
		}
		Rectangle {
		    anchors.left: p.right
		    anchors.top: p.top
		    anchors.leftMargin: 4
			width: parent.width*0.16
			height: parent.height*0.16
			x: 80; y:90
			color: "blue"
			opacity: 0.9
		}
	}
}