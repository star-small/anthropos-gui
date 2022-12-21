import QtQuick 2.15
import "../config"
Item {
    width: 412 - 70
    height: 50
    property string btnState: "show"
    signal barBtnClicked()
    Rectangle {
        color: Config.frame_color
        width: parent.width
        height: parent.height
        Text {
            id: label
            text: qsTr("Anthropos")
            anchors.centerIn: parent
            color: Config.text_color
            font.pixelSize: 20
        }
        Rectangle {
            width: parent.height; height: parent.height
            color: "transparent"
            anchors.right: parent.right
            BurgerMenuButton {
                id: burger
                btnColor: Config.frame_color2
                state: btnState
                width: parent.height-20; height: parent.height-30
                anchors.centerIn: parent
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        btnState = parent.state === "show" ? "hide" : "show"
                    }
                }
            }

        }
    }
}
