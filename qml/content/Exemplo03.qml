import QtQuick 2.4

Rectangle {
	width: 200
	height: 100
	color: "green"
	Rectangle {
		width: { 
		    return height * 2
		}
		height: 50
		color: "white"
		opacity: 0.5
	}
}