import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.LocalStorage 2.0

import "../components"
Item {
    id: root

    FieldComponent {
        id: field
        anchors.centerIn: parent
        signal choose(bool status)
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
            popup.open()
        }
    }
    Popup {
        id: popup
        width: parent.width
        height: 50
        anchors.centerIn: parent
        modal: true
        focus: true
        topPadding: 0
        bottomPadding: 0
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
        }
        Feelings {
            widthSq: parent.height
            parentWidth: parent.width
            //spaces: 3
            width: parent.width
            onFeelClicked: (choose)=>{
                field.choose(true)
                popup.close()

            }
        }

    }

}
