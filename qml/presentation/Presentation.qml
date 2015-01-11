/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QML Presentation System.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/


import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Item {
    id: root

    property variant slides: []
    property int currentSlide;

    property bool showNotes: false;
    property bool allowDelay: true;

    property color titleColor: textColor;
    property color textColor: "black"
    property string fontFamily: "Helvetica"
    property string codeFontFamily: "Courier New"

    // Private API
    property bool _faded: false
    property int _userNum;

    Component.onCompleted: {
        var slideCount = 0;
        var slides = [];
        for (var i=0; i<root.children.length; ++i) {
            var r = root.children[i];
            if (r.isSlide) {
                slides.push(r);
            }
        }

        root.slides = slides;
        root._userNum = 0;

        // Make first slide visible...
        if (root.slides.length > 0) {
            root.currentSlide = 0;
            root.slides[root.currentSlide].visible = true;
        }
    }

    function switchSlides(from, to, forward) {
        from.visible = false
        to.visible = true
        return true
    }

    function goToNextSlide() {
        root._userNum = 0
        if (_faded)
            return
        if (root.slides[currentSlide].delayPoints) {
            if (root.slides[currentSlide]._advance())
                return;
        }
        if (root.currentSlide + 1 < root.slides.length) {
            var from = slides[currentSlide]
            var to = slides[currentSlide + 1]
            if (switchSlides(from, to, true)) {
                currentSlide = currentSlide + 1;
                root.focus = true;
            }
        }
    }

    function goToPreviousSlide() {
        root._userNum = 0
        if (root._faded)
            return
        if (root.currentSlide - 1 >= 0) {
            var from = slides[currentSlide]
            var to = slides[currentSlide - 1]
            if (switchSlides(from, to, false)) {
                currentSlide = currentSlide - 1;
                root.focus = true;
            }
        }
    }

    function goToUserSlide() {
        --_userNum;
        if (root._faded || _userNum >= root.slides.length)
            return
        if (_userNum < 0)
            goToNextSlide()
        else if (root.currentSlide != _userNum) {
            var from = slides[currentSlide]
            var to = slides[_userNum]
            if (switchSlides(from, to, _userNum > currentSlide)) {
                currentSlide = _userNum;
                root.focus = true;
            }
        }
    }

    function goToSlide(slideNum) {
        if (root._faded || slideNum < 0 || slideNum >= root.slides.length)
            return
        else if (root.currentSlide !== slideNum) {
            var from = slides[currentSlide]
            var to = slides[slideNum]
            if (switchSlides(from, to, slideNum > currentSlide)) {
                currentSlide = slideNum;
                root.focus = true;
            }
        }
    }

    focus: true

    //Keys.onSpacePressed: goToNextSlide()
    Keys.onRightPressed: goToNextSlide()
    Keys.onDownPressed: goToNextSlide()
    Keys.onLeftPressed: goToPreviousSlide()
    Keys.onUpPressed: goToPreviousSlide()
    Keys.onEscapePressed: win.showNormal()
    Keys.onPressed: {
        if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9)
            _userNum = 10 * _userNum + (event.key - Qt.Key_0)
        else {
            if (event.key == Qt.Key_Return || event.key == Qt.Key_Enter)
                goToUserSlide();
            else if (event.key == Qt.Key_Backspace)
                goToPreviousSlide();
            else if (event.key == Qt.Key_C)
                root._faded = !root._faded;
            _userNum = 0;
        }
    }
    Action {
        shortcut: "ctrl+shift+f"
        onTriggered: win.showFullScreen()
    }
    Action {
        shortcut: "ESC"
        onTriggered: win.showNormal()
    }
    Action {
        shortcut: "alt+/"
        onTriggered: root._faded = !root._faded;
    }
    Action {
        shortcut: "Ctrl+Shift+ALT+backspace"
        onTriggered: {
            messageDialog.open()
        }
    }
    Action {
        shortcut: "Ctrl+Shift+s"
        onTriggered: {
            fileDialog.open()
        }
    }
    Item {
        width: 60
        height: 60
        z: 998
    Image {
        anchors.margins: 5
        anchors.fill: parent

        source: "qrc:/assets/images/qt_logo.png"
        fillMode: Image.PreserveAspectFit
    }
    }
    MessageDialog {
        id: messageDialog
        title: "Limpar códigos"
        text: "Tem certeza que deseja apagar todos os códigos da apresentação?"
        icon: StandardIcon.Warning
        standardButtons: StandardButton.Yes | StandardButton.Abort
        onYes: _storage.clearAllQml()
    }
    FileDialog {
        id: fileDialog
        selectFolder: true
        onAccepted: {
            console.log("saving...", fileUrl)
            _storage.exportAllQml(fileUrl)
        }
    }

    Item {
        width: parent.width * 0.1
        height: parent.height
        MouseArea {
            id: mArea
            anchors.fill: parent
            hoverEnabled: true
        }
    }
    ListView {
        id: shortcutList
        z: 999
        height: 400 //parent.height
        width: 320
        opacity: mArea.containsMouse
        enabled: false
        header: Rectangle {
            width: shortcutList.width
            height: content.contentHeight*1.3
            color: "#33FFFFFF"
            Text {
                id: content
                text: "Shortcuts"
                font.bold: true
                font.capitalization: Font.AllUppercase
                color: "white"
                anchors.centerIn: parent
            }
            Rectangle {
                color: "#33FFFFFF"
                width: parent.width
                height: 1
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutQuint
            }
        }
        model: [
            "C : Show questions screen",
            "CTRL+SHIFT+F : Full screen",
            "ESC : Exit full screen",
            "ALT+/ : Question mode",
            "CTRL+SHIFT+S : Export All QML",
            "Ctrl+Shift+ALT+backspace : Clear all code data"
        ]
        delegate: Rectangle {
            width: 320 //content.contentWidth*1.3
            height: contentSCList.contentHeight*1.3
            color: "#99000000"
            Text {
                id: contentSCList
                text: modelData
                color: "white"
                anchors.centerIn: parent
            }
            Rectangle {
                color: "#44000000"
                width: parent.width
                height: 1
            }
        }
    }
    Item {
        width: parent.width * 0.1
        height: parent.height
        anchors.right: parent.right
        MouseArea {
            id: mAreaSlides
            anchors.fill: parent
            hoverEnabled: true
        }
    }
    ListView {
        id: slideList
        z: 999
        height: parent.height
        width: 250
        anchors.right: root.right
        opacity: mAreaSlides.containsMouse
        enabled: mAreaSlides.containsMouse
        header: Rectangle {
            width: slideList.width
            height: contentSlide.contentHeight*1.3
            color: "#33FFFFFF"
            Text {
                id: contentSlide
                text: "Slides"
                font.bold: true
                font.capitalization: Font.AllUppercase
                color: "white"
                anchors.centerIn: parent
            }
            Rectangle {
                color: "#33FFFFFF"
                width: parent.width
                height: 1
            }
        }
        Behavior on opacity {
            NumberAnimation {
                duration: 1000
                easing.type: Easing.OutQuint
            }
        }
        model: root.slides
        delegate: Rectangle {
            id: item
            width: 320 //content.contentWidth*1.3
            height: contentSlide2.contentHeight*1.5
            color: root.currentSlide == index || slideListTouch.pressed ? "#ff000000" : "#99000000"
            Row {
                anchors.verticalCenter: item.verticalCenter
                spacing: 5
                Rectangle {
                   width: 20
                   height: item.height
                   Text {
                       text: index
                       anchors.centerIn: parent
                       color: "white"
                   }
                   color: "#22FFFFFF"
                }
                Text {
                    id: contentSlide2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.leftMargin: 5
                    text: modelData["title"]
                    color: "white"
                    //anchors.centerIn: parent
                }
            }
            Rectangle {
                color: "#44000000"
                width: parent.width
                height: 1
            }
            MouseArea {
                id: slideListTouch
                anchors.fill: parent
                onClicked: {
                    root.goToSlide(index)
                    //slideList.currentIndex = index
                }
            }
        }
    }

    Rectangle {
        z: 1000
        color: "black"
        anchors.fill: parent
        opacity: root._faded ? 1 : 0
        Behavior on opacity { NumberAnimation { duration: 250 } }
        Label {
            anchors.centerIn: parent
            font.pixelSize: parent.height*0.1
            text: "Questions?"
            color: "white"
        }
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: {
            if (mouse.button == Qt.RightButton)
                goToPreviousSlide()
            else
                goToNextSlide()
        }
        onPressAndHold: goToPreviousSlide(); //A back mechanism for touch only devices
    }

    Window {
        id: notesWindow;
        width: 400
        height: 300

        title: "QML Presentation: Notes"
        visible: root.showNotes

        Text {
            anchors.fill: parent
            anchors.margins: parent.height * 0.1;

            font.pixelSize: 16
            wrapMode: Text.WordWrap

            property string notes: root.slides[root.currentSlide].notes;
            text: notes == "" ? "Slide has no notes..." : notes;
            font.italic: notes == "";
        }
    }
}
