import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../config"
import "../components"
Page {
    background: Rectangle {
        color: Config.bg_color
    }
    id: root
    CsTopBar {
        width: parent.width
    }
}
