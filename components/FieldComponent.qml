import QtQuick 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0

Item {
    width: 250
    height: 30

    TextField {
        width: parent.width
        height: parent.height
        color: "black"
        clip: true
        font.pixelSize: 15
        horizontalAlignment: "AlignHCenter"
        placeholderText: "Поделись впечатлениями"
        background: Rectangle {
            anchors.fill: parent
            color: "lightgrey"
        }

        //wrapMode: TextInput.WrapAnywhere
        Rectangle {
            height: 2
            width: parent.width
            anchors.bottom: parent.bottom
            color: "white"
        }


    }

}
