import QtQuick 2.15
import "../config"
Item {
    id: root
    signal csClicked()
    property string csText
    property int csRadius: 0
    property double csOpacity: 1
    property alias csAnchor: txt.anchors

    Text {
        id: txt
        text: qsTr(csText)
        state: "left"
        states: [
            State {
                name: "center"
                AnchorChanges {
                    target: txt
                    anchors.horizontalCenter: rect.horizontalCenter
                    anchors.verticalCenter: rect.verticalCenter
                }
            },
            State {
                name: "left"
                AnchorChanges {
                    target: txt
                    anchors.left: rect.left
                }

            }
        ]
        color: Config.text_color
    }
    Rectangle {
        id: rect
        anchors.fill: parent
        color: Config.frame_color
        radius: csRadius
        opacity: csOpacity

    MouseArea {
        anchors.fill: parent
        onClicked: {
            csClicked()
        }
        onPressed: {
            rect.color = Config.frame_color2
        }
        onReleased: {
            rect.color = Config.frame_color
        }
        onCanceled: {
            rect.color = Config.frame_color
        }
    }
    }
}
