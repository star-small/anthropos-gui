import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import "../config"
import "../components"
Item {
    id: root
    anchors.top: topBar.bottom
    Drawer {
            id: sidePanel
            width: 0.66 * parent.width
            height: parent.height //- topBar.height
            y: topBar.height
            interactive: root.visible
            background: Rectangle {
                color: Config.bg_color
                ListView {
                    anchors.topMargin: 50
                    anchors.rightMargin: -10
                    id: listView
                    anchors.fill: parent
                    spacing: 5
                    model: ["ToDo", "New Event", "Pomodoro", "Journal"]
                    delegate: CsButton {
                        csOpacity: 0.3
                        csRadius: 5
                        width: sidePanel.width
                        height: 40
                        csText: modelData

                    }
                }
            }
            Component.onCompleted: {
                console.log(root.visible)
            }
        onClosed: {
            topBar.btnState = "show"
        }
        onOpened: {
            topBar.btnState = "hide"
        }
    }



    CsTopBar {
        height: 50
        id: topBar
        onBtnStateChanged: {
            console.log(topBar.btnState)
            topBar.btnState == "hide" ? sidePanel.open() : sidePanel.close()
        }

    }

    Text {
        id: name
        text: qsTr("tsrrrrrrrrrext")
        color: Config.text_color
    }


    TabBar {
        id: bar
        width: parent.width
        height: 30
        anchors.bottom: parent.bottom
        TabButton {
            indicator: CsButton {
                height: bar.height
                csText: "Main"
                csHighlight: Config.frame_color2
            }
            background: CsButton {
                height: bar.height
                csText: "Main"
                csHighlight: Config.frame_color
            }
        }
        TabButton {
            indicator: CsButton {
                height: bar.height
                csText: "Stat"
                csHighlight: Config.frame_color2
            }
            background: CsButton {
                height: bar.height
                csText: "Stat"
                csHighlight: Config.frame_color
            }
        }
        TabButton {
            background: CsButton {
                height: bar.height
                csText: "Settings"
            }
        }
    }



}
