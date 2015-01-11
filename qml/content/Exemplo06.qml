import QtQuick 2.4

Item {
    id: self
    width: 200; height: 200
	function anchor(component) {
		component.width = component.parent.width
		component.height = component.parent.height		
	}
    Rectangle {
        id: r1
    	Component.onCompleted: {
    		self.anchor(r1)
    	}
    	y: 60
    	x: 60
    	z: r3.z + 1
    	color: "red"
    }
    Rectangle {
        id: r2
    	Component.onCompleted: {
    		self.anchor(r2)
    	}
    	x: 120
    	y: 120
    	z: r1.z + 1
    	color: "blue"
    }
    Rectangle {
        id: r3
    	Component.onCompleted: {
    		self.anchor(r3)
    		console.log(r1.z, r2.z, r3.z)
    	}
    }
}
