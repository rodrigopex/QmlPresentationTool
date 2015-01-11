import QtQuick 2.4

Rectangle {
    id: self
    anchors.fill: parent
	color: "#262626"
	Rectangle {
	    anchors.fill: parent
	    anchors.margins: 20
		color: "#FAFAFA"
		Item {
		    anchors.centerIn: parent
		    width: a.width + b.width + c.width
		    height: a.height + b.height + c.height
			Rectangle {
			    id: a			    
				width: self.width*0.09
				height: self.height*0.09
				color: "#c80000"
			}
			Rectangle {
			    id: b
   			    anchors.top: a.bottom
			    anchors.left: a.right
				width: self.width*0.54
				height: self.height*0.09
				color: "#00c800"
			}
			Rectangle {
			    id: c
			    anchors.top: b.bottom
			    anchors.left: b.right
				width: self.width*0.18
				height: self.height*0.09
				color: "#0000c8"
			}
		}
	}
	
}