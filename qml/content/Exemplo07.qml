import QtQuick 2.4

Rectangle {
	anchors.left: parent.left
	anchors.right: parent.right
	anchors.top: parent.top
	anchors.bottom: parent.bottom
	color: "lightgreen"
	Rectangle {
	    id: rg
		width: 100
		height: 100
		color: "green"
		x: 100
		y: 420
	}
	Rectangle {
		id: rr
		anchors.left: rg.right
		anchors.top: rg.top
		width: 100
		height: 100
		color: "red"
	}
	Rectangle {
		id: rb
		anchors.left: rr.right
		anchors.top: rg.top
		width: 100
		height: 100
		color: "blue"
	}
	    
}