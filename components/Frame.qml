import QtQuick 2.15
import QtQuick.Controls 2.0
import "../config"
Item {
    Config {id:cfg}
    Rectangle {
        width:100; height: 100
        anchors.fill: parent
        color: cfg.frame_color
        radius: 10
        Button {
            id: btn
            text: "change"
            onClicked: {
                cfg.darkTheme = true
            }
        }
    }
}
