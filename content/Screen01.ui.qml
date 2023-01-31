

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import ToDo
import QtQuick.Layouts 1.0

Rectangle {
    id: rectangle
    width: Constants.width
    height: 500

    color: Constants.backgroundColor

    Button {
        id: addTODO_button
        y: 110
        text: qsTr("Add ToDo")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
    }

    Rectangle {
        id: addTODO_dialog
        x: 10
        y: 289
        width: 380
        height: 149
        color: "#e0e0e0"
        radius: 30

        TextField {
            id: rodo_textInput
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            placeholderTextColor: "#f1353637"
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            anchors.topMargin: 25
            placeholderText: qsTr("TODO")
        }

        RowLayout {
            x: 14
            y: 101
            width: 349
            height: 40
            spacing: 50
            Button {
                id: cancel_button
                text: qsTr("Cancel")
                Layout.fillWidth: true
            }

            Button {
                id: add_button
                text: qsTr("Add")
                highlighted: false
                icon.color: "#cf606368"
                Layout.fillWidth: true
            }
        }
    }
    states: [
        State {
            name: "clicked"
            when: cancel_button.checked
        }
    ]
}
