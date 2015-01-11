import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import DocumentHandler 1.0
import "../Colors.js" as Colors

Item {
    id: self
    property string codeId
    property alias code: documentHandler.text
    anchors.fill: parent
    Action {
        property alias textPointSize: editor.font.pointSize
        shortcut: StandardKey.ZoomIn
        onTriggered: {
            console.log("zoomIn")
            textPointSize++
            editor.focus = false
        }
    }
    Action {
        shortcut: StandardKey.SelectEndOfDocument
        onTriggered: {
            console.log(editor.cursorDelegate)
        }
    }
    Action {
        property alias textPointSize: editor.font.pointSize
        shortcut: StandardKey.ZoomOut
        onTriggered: {
            console.log("zoomIn")
            textPointSize--
            editor.focus = false
        }
    }

    Action {
        shortcut: StandardKey.Save
        onTriggered: {
            console.log("save")
        }
    }
    SplitView {
        anchors.fill: parent
        Rectangle {
            id: editorSide
            Layout.preferredHeight: parent.height
            Layout.minimumWidth: parent.width/2
            Rectangle {
                width: 25
                height: editorSide.height
                color: Colors.base02
            }
            Rectangle {
                id: editorCurrentLineHighlight
                anchors {
                    left: editorSide.left
                    right: editorSide.right
                }
                visible: editor.focus
                width: editor.width
                height: editor.cursorRectangle.height
                y: editor.cursorRectangle.y + 10 //lineNumberPadding
                color: Colors.base02
            }
            color: Colors.base03
            MouseArea {
                anchors.fill: parent
                onClicked: editor.forceActiveFocus()
            }
            ScrollView {
                id: scrollContent
                anchors.fill: parent
                anchors.topMargin: 10
                Row {
                    //spacing: 5
                    Column {
                        id: lineNumber
                        Repeater {
                            id: lineNumberRepeater
                            model: editor.lineCount
                            Item {
                                width: 25
                                height: editor.cursorRectangle.height
                                //height: editor.font.pixelSize + 5 //editor.cursorRectangle.height
                                Text {
                                    anchors.margins: 2
                                    anchors.right: parent.right
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: index + 1
                                    color: Colors.base0
                                    font.pointSize: editor.font.pointSize - 2 //editor.font.pixelSize
                                }
                            }
                        }
                    }
                    TextEdit {
                        id: editor
                        objectName: "editor"
                        onTextChanged: {
                            documentHandler.save(self.codeId, text)
                            if(test.dyComponent) test.dyComponent.destroy()
                            var dyComponent = Qt.createQmlObject(editor.text, test, "DynamicSlideCode")
                            if(dyComponent) {
                                dyComponent.error
                                test.dyComponent = dyComponent
                            }
                        }
                        color: Colors.base0
                        selectionColor: Colors.base01
                        selectByMouse: true
                        font {
                            pointSize: 18
                            family: "Monaco"
                        }
                        //text: documentHandler.text
                        // FIXME: stupid workaround for indent
                        Keys.onPressed: {
                            if (event.key === Qt.Key_BraceRight) {
                                editor.select(0, cursorPosition)
                                var previousContent = editor.selectedText.split(/\r\n|\r|\n/)
                                editor.deselect()
                                var currentLine = previousContent[previousContent.length - 1]
                                var leftBrace = /{/, rightBrace = /}/;
                                if (!leftBrace.test(currentLine)) {
                                    editor.remove(cursorPosition, cursorPosition - currentLine.length);
                                    currentLine = currentLine.toString().replace(/ {1,4}$/, "");
                                    editor.insert(cursorPosition, currentLine);
                                }
                            }
                        }
                        Keys.onReturnPressed: {
                            editor.select(0, cursorPosition)
                            var previousContent = editor.selectedText.split(/\r\n|\r|\n/)
                            editor.deselect()
                            var currentLine = previousContent[previousContent.length - 1]
                            var leftBrace = /{/, rightBrace = /}/;
                            editor.insert(cursorPosition, "\n")
                            var whitespaceAppend = currentLine.match(new RegExp(/^[ \t]*/))  // whitespace
                            if (leftBrace.test(currentLine)) // indent
                                whitespaceAppend += "    ";
                            editor.insert(cursorPosition, whitespaceAppend)
                        }

                        DocumentHandler {
                            id: documentHandler
                            target: editor
                            //text: editor.text
                            Component.onCompleted: {
                                documentHandler.load(self.codeId)
                                editor.text = documentHandler.text
                            }
                        }
                    }
                }
            }
        }
        Rectangle {
            id: test
            property variant dyComponent: undefined
            Layout.preferredHeight: parent.height
            color: "lightgray"
            Layout.minimumWidth: parent.width/3
        }
    }
}
