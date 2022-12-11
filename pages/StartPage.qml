import QtQuick 2.15
import QtQuick.Controls 2.0

import QtQuick.LocalStorage 2.0

import "../components"
import "../config"
Item {
    id: root

    FieldComponent {
        id: field
        anchors.centerIn: parent
        signal choose(bool status)
    }

    Button {
        id: btn
        width: name.width+10
        height: name.height+10
        anchors.top: field.bottom
        anchors.horizontalCenter: field.horizontalCenter
        anchors.topMargin: 20
        Text {
            id: name
            anchors.centerIn: parent
            text: qsTr("Отправить")
            color: Config.text_color
        }


        onPressed: {
            popup.open()
        }
        background: Frame {}
    }



    Popup {
        id: popup
        width: parent.width
        height: 50
        topMargin: parent.height/2 - 150
        modal: true
        focus: true
        topPadding: 0
        bottomPadding: 0
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
        }
        Text {
            id: txt
            text: qsTr("Оцените ваше состание по этой шкале:")
            font.pixelSize: 13
            anchors.centerIn: parent
            color: Config.text_color
        }
        Feelings {
            widthSq: parent.height
            parentWidth: parent.width
            anchors.top: txt.bottom
            anchors.topMargin: 20
            //spaces: 3
            width: parent.width
            onFeelClicked: (choose)=>{
                field.choose(true)
                popup.close()
            }
        }

    }

}
