

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
    height: 600
    color: "#383636"
    border.color: "#909090"
    property bool isDialogOpen: false

    Text {
        id: text1
        color: "#0e708f"
        text: qsTr("ToDo")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.italic: true
        font.bold: true
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.topMargin: 10
    }

    Button {
        id: addTODO_button
        y: 110
        text: qsTr("Add ToDo")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        icon.color: "#d4d4d4"
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10

        Connections {
            target: addTODO_button
            onClicked: rectangle.isDialogOpen = !rectangle.isDialogOpen
        }
    }

    Rectangle {
        id: addTODO_dialog
        x: 10
        y: 382
        width: 380
        height: 149
        visible: rectangle.isDialogOpen
        color: "#9be0e0e0"
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
            placeholderText: qsTr("New item")
        }

        RowLayout {
            x: 25
            y: 93
            width: 330
            height: 40
            spacing: 50
            Button {
                id: cancel_button
                text: qsTr("Cancel")
                Layout.fillWidth: true

                Connections {
                    target: cancel_button
                    onClicked: rectangle.isDialogOpen = false
                }

                Connections {
                    target: cancel_button
                    onClicked: rodo_textInput.text = ""
                }
            }

            Button {
                id: add_button
                text: qsTr("Add")
                highlighted: false
                icon.color: "#cf606368"
                Layout.fillWidth: true

                Connections {
                    target: add_button
                    onClicked: rectangle.isDialogOpen = false
                }

                Connections {
                    target: add_button
                    onClicked: myListModel.append(myListModel.createListElement())
                }
            }
        }
    }

    Column {
        id: column
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 20
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 100
        anchors.topMargin: 50

        Repeater {
            id: repeater
            anchors.fill: parent
            model: ListModel {
                id: myListModel
                ListElement {
                    name: "my to do"
                }
                function createListElement(){
                    return {
                        "name": rodo_textInput.text
                    }
                }
            }

            Rectangle {
                id: todo_item
                x: -1
                y: 13
                width: 382
                height: 62
                color: "#ababab"
                radius: 10

                CheckBox {
                    id: checkBox
                    text: name
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pointSize: 20
                    anchors.bottomMargin: 7
                    anchors.rightMargin: 5
                    anchors.leftMargin: 5
                    anchors.topMargin: 7
                }
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
