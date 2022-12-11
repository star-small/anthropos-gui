import QtQuick 2.15
import Qt.labs.settings 1.0
pragma Singleton

Item {
    id: config

    property bool darkTheme: true

    readonly property string bg_color: darkTheme ? "#272932" : "#B6C2D9"
    readonly property string frame_color: darkTheme ? "#4D7EA8" : "#35CE8D"
    readonly property string text_color: darkTheme ? "white" : "black"
    readonly property string spare_color: "#CE8147"

    Settings {
        property alias darkTheme: config.darkTheme
    }

}

