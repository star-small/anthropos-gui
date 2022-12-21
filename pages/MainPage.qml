import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import "../config"
import "../components"
Item {
    TabBar {
        id: bar
        width: parent.width
        height: 30
        anchors.bottom: parent.bottom
        TabButton {
            background: CsButton {
                height: bar.height
                csText: "Main"
            }
        }
        TabButton {
            background: CsButton {
                height: bar.height
                csText: "Stat"
            }
        }
        TabButton {
            background: CsButton {
                height: bar.height
                csText: "Settings"
            }
        }
    }
    Page {
        id: page
        height: parent.height-topBar.height-bar.height
        anchors.top: topBar.bottom
        background: Rectangle {
            color: Config.bg_color
        }
        Text {
            id: name
            text: qsTr("tsrrrrrrrrrext")
            color: Config.text_color
        }
        Drawer {
                id: sidePanel
                width: 0.66 * parent.width
                height: parent.height - topBar.height
                y: topBar.height
                modal: true
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
            onClosed: {
                topBar.btnState = "show"
            }
            onOpened: {
                topBar.btnState = "hide"
            }
        }

    }


    CsTopBar {
        id: topBar
        width: parent.width
        anchors.top: parent.top
        onBtnStateChanged: {
            console.log(topBar.btnState)
            topBar.btnState == "hide" ? sidePanel.open() : sidePanel.close()
        }

    }




}
