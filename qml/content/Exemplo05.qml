import QtQuick 2.4

Rectangle {
	id: self
	function anchorParent(component) {
		component.width = component.parent.width
		component.height = component.parent.height		
	}
	color: { 
	    return touch.checked ? "green" : "lightgreen"
	}
	Component.onCompleted: self.anchorParent(self)
	MouseArea {
	    id: touch
	    property bool checked: false
		width: parent.width; height: parent.height		
		onClicked: checked = !checked
		Component.onCompleted: self.anchorParent(touch)		
	}
}