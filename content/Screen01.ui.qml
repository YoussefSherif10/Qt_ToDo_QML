

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import ToDo

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
    states: [
        State {
            name: "clicked"
            when: button.checked
        }
    ]
}
