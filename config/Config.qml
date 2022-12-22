import QtQuick 2.15
import Qt.labs.settings 1.0

pragma Singleton

Item {
    id: config

    property bool darkTheme: true

    property string bg_color: darkTheme ? "#050b12" : "#B6C2D9"
    property string frame_color: darkTheme ? "#26619c" : "#35CE8D"
    property string frame_color2: darkTheme ? "#86abd1" : "#277353"
    property string darkFrame: darkTheme ? "#121921" : "#dce6e2"
    property string text_color: darkTheme ? "white" : "#1b1c1b"
    property string spare_color: "#CE8147"

    Behavior on bg_color {
        ColorAnimation {
            easing.type: Easing.InQuad
            duration: 300
        }
    }
    Behavior on text_color {
        ColorAnimation {
            easing.type: Easing.InQuad
            duration: 400
        }
    }
    Behavior on frame_color {
        ColorAnimation {
            easing.type: Easing.InQuad
            duration: 500
        }
    }
    Behavior on frame_color2 {
        ColorAnimation {
            easing.type: Easing.InQuad
            duration: 400
        }
    }

    Settings {
        property alias darkTheme: config.darkTheme
    }
}

