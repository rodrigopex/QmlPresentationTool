import QtQuick 2.4

Rectangle {
	anchors.fill: parent
	color: "lightgreen"
	Row {
	    x: 100
		y: 420
		Rectangle {
	   	 	id: rg
			width: 100
			height: 100
			color: "green"		
		}	
		Rectangle {
			id: rr
			width: 100
			height: 100
			color: "red"
		}
		Rectangle {
			id: rb
			width: 100
			height: 100
			color: "blue"
		}
	}   
}
