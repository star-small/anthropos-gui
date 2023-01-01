import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

import "../config"

Item {
    width: 250
    height: 30

    TextField {

        width: parent.width
        height: parent.height
        color: Config.text_color
        clip: true
        font.pixelSize: 15
        horizontalAlignment: "AlignHCenter"
        placeholderText: "Новое событие"
        background: Rectangle {
                    radius: 10
                    color: Config.frame_color
                    border.width: 0
                }


        //wrapMode: TextInput.WrapAnywhere



    }

}
