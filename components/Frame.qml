import QtQuick 2.15
import QtQuick.Controls 2.15
import "../config"
Item {
    property int radiusVal: 10
    Rectangle {
        anchors.fill: parent
        color: Config.frame_color
        radius: radiusVal
    }
}
