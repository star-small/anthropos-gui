import QtQuick 2.15
pragma Singleton

QtObject {
    id: config
    property bool darkTheme: true
    property string bg_color: darkTheme ? "#272932" : "#B6C2D9"
    property string frame_color: darkTheme ? "#4D7EA8" : "#35CE8D"
    property string spare_color: "#CE8147"
    property string text_color: darkTheme ? "white" : "black"
}
