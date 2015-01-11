import QtQuick 2.4

Rectangle {
    x: parent.width/2 - 200   /*Por que isso?*/
    y: parent.height/2 - 200  /*Por que isso?*/
    width: 400
    height: 400
    color: "gray"
	Rectangle {
		width: 360; height: 360
		x: 20; y: 20
		color: "green"
		Rectangle {
			width: 360; height: 180
			color: "lightblue"
			Rectangle {
				width: 50; height: 50
				x: 80; y:60
			}
		}
		Rectangle {
			width: 150; height: 50
			x: 180; y:260
			color: "blue"
		}
	}
}