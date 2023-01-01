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
                    Rectangle {
                        id: events
                        opacity: 1.0
                        radius: 0
                        width: parent.width
                        height: 40
                        color: Config.frame_color
                        Text {
                            id: name
                            anchors.centerIn: parent
                            opacity: 1
                            color: Config.text_color
                            text: qsTr("Events")
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                stackView.replace(eventPage)
                                sidePanel.close()
                            }
                        }
                    }
                    Rectangle {
                        opacity: 1.0
                        radius: 0
                        width: parent.width
                        height: 40
                        y: events.height + 5
                        color: Config.frame_color
                        Text {
                            anchors.centerIn: parent
                            opacity: 1
                            color: Config.text_color
                            text: qsTr("To do")
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

    StackView {
        id: stackView
        initialItem:content
        anchors.fill: parent
        replaceEnter: Transition {
            PropertyAnimation {
                property: "x"
                easing.type: Easing.Linear
                from: window.width
                to:0
                duration: 200
            }

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
        Column {
            id: flick
            anchors.fill: parent
            spacing: 2
                width: parent.width
                height: name.height
            Text {
                z: -1
                anchors.fill: parent
                id: contentText
                text: qsTr(" Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum.Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum. Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum.Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum.Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum.Lorem ipsucm dolor sit amet, consectetur adipiscing elit. Quisque vel pulvinar sapien, nec pharetra leo. Aliquam non mauris ac lacus commodo consectetur. Maecenas mollis magna a dolor ornare laoreet. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eu porttitor sem. Sed lacinia, arcu nec tincidunt molestie, sem felis consequat velit, id tristique orci elit eget quam. Curabitur eu accumsan erat. Maecenas vel ultricies dui. Fusce efficitur felis augue, non commodo nulla suscipit at. In a purus urna. Pellentesque pulvinar faucibus nulla vitae iaculis. Morbi euismod nisi id aliquam maximus. Proin tempor lorem in felis aliquam, et malesuada purus blandit. Vestibulum sed laoreet lorem, id sodales ipsum. Suspendisse ullamcorper tortor vulputate commodo fermentum.")
                font.pointSize: 9
                wrapMode: Text.WordWrap
                color: Config.text_color
            }


        }

    }
    Page {
        id: statistics
        anchors.top: topBar.bottom
        visible: false
        height: parent.height -bar.height
        width: parent.width
        background: Rectangle {
            color: "red"
        }
    }
    Page {
        id: settings
        anchors.top: topBar.bottom
        visible: false
        width: parent.width
        height: parent.height -bar.height
        background: Rectangle {
            color: "green"
        }
    }
    Page {
        id: eventPage
        anchors.top: topBar.bottom
        visible: false
        width: parent.width
        height: parent.height -bar.height
        background: Rectangle {
            color: "green"
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

            onClicked:{
                stackView.replace(content)

            }
            onWidthChanged: console.log(height)
        }
        TabButton {
            text: "Statistics"
            onClicked: {

                stackView.replace(statistics)


            }
        }
        TabButton {
            text: "Settings"
            onClicked: {
                stackView.replace(settings)
            }
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
                    NumberAnimation { easing.type: Easing.Linear;duration:200}
                }
            }



}
