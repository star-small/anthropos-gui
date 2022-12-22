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
    signal toBackClicked()
    Drawer {
            id: sidePanel
            width: 0.66 * parent.width
            height: parent.height //- topBar.height
            y: topBar.height
            interactive: root.visible
            background: Rectangle {
                color: Config.darkFrame
                ListView {
                    anchors.topMargin: 0
                    anchors.rightMargin: -10
                    id: listView
                    anchors.fill: parent
                    spacing: 5
                    model: ["ToDo", "New Event", "Pomodoro", "Journal"]
                    delegate: CsButton {
                        csOpacity: 0.3
                        csRadius: 0
                        csHighlight: Config.frame_color2
                        width: sidePanel.width
                        height: 40
                        csText: modelData
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                toBackClicked()
                                sidePanel.close()
                            }
                        }
                    }
                }
            }
            Component.onCompleted: {
            }
        onClosed: {
            topBar.btnState = "show"
        }
        onOpened: {
            topBar.btnState = "hide"
        }
    }



    CsTopBar {
        id: topBar
        height: 50
        z: 1
        width: parent.width
        onBtnStateChanged: {
            console.log(topBar.btnState)
            topBar.btnState == "hide" ? sidePanel.open() : sidePanel.close()
        }
        onBarBtnClicked: {
            console.log("click!")
        }

    }

    Page {
        id: content
        anchors.top: topBar.bottom
        anchors.bottom: bar.top
        width: parent.width

        background: Rectangle {
            color: Config.bg_color
        }
        Flickable {
            id: flick
            anchors.fill: parent
            contentHeight: 0; contentWidth: parent.width

            Text {
                z: -1
                anchors.fill: parent
                id: name
                text: qsTr(" Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum. ")
                wrapMode: Text.WordWrap
                color: Config.text_color
            }
        }

    }


    TabBar {
        id: bar
        width: parent.width
        height: 30
        anchors.bottom: parent.bottom
        TabButton {
            id: tb
            text: "Home"
        }
        TabButton {
            text: "Statistics"
        }
        TabButton {
            text: "Settings"
        }
        onWidthChanged: {
            console.log(bar.currentItem.x, bar.currentIndex)
        }
    }
    Rectangle {
                id : decorator;
                x: bar.currentItem.width * bar.currentIndex+1
                anchors.bottom: bar.top;
                width: tb.width;
                height: 3;
                color: Config.frame_color2
                Behavior on x {
                    NumberAnimation {duration:200}
                }
            }



}
