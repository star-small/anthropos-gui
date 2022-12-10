import QtQuick 2.15
import QtQuick.Controls 2.0
import "components"
Item {
    id: root
    signal clickPressed(status: bool)
    FieldComponent {
        id: field
        anchors.centerIn: parent

    }

    Button {
        id: btn
        anchors.top: field.bottom
        anchors.horizontalCenter: field.horizontalCenter
        anchors.topMargin: 20
        Text {
            text: qsTr("Submit")
            anchors.centerIn: parent
        }
        onPressed: {
            root.clickPressed(true)
        }
    }

}
