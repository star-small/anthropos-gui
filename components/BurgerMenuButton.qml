import QtQuick 2.15
import "../config"
Item {
    id: burger

    signal burgerClicked(status: bool)
    property string btnColor
    property int thikness: height/5
    Rectangle {
        id: inTop
        color: btnColor
        height: thikness
        width: parent.width
        state: "show"
        radius: 20
        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: inTop
                    rotation: 0
                    y: 0
                    x: 0
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    target: inTop
                    rotation: 45
                    y: burger.height/2
                    x: 0
                }
            }
        ]
        transitions: Transition {
            from: "show"
            to: "hide"
            reversible: true
            NumberAnimation {
                properties: "x, y, rotation"
                duration: 200
                //easing.type: Easing.InOutQuad
            }
        }
    }

    Rectangle {
        id: inCenter

        height: thikness
        width: parent.width
        anchors.centerIn: parent
        state:"show"
        radius: 20

        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: inCenter
                    color: btnColor
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    target: inCenter
                    color: "transparent"
                }
            }
        ]
        transitions: Transition {
            from: "show"
            to: "hide"
            reversible: true

            ColorAnimation {
                to: "transparent"
                duration: 100
            }
        }
    }

    Rectangle {
        id: inBottom
        color: btnColor
        height: thikness
        width: parent.width
        state: "show"
        radius: 20

        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: inBottom
                    rotation: 0
                    y: burger.height - inBottom.height
                    x: 0
                }
            },
            State {
                name: "hide"
                PropertyChanges {
                    target: inBottom
                    rotation: -45
                    y: burger.height/2
                    x: 0
                }
            }
        ]

        transitions: Transition {
            from: "show"
            to: "hide"
            reversible: true
            NumberAnimation {
                properties: "x, y, rotation"
                duration: 200
                //easing.type: Easing.OutCubic
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            inTop.state = inTop.state=="show" ? "hide" : "show"
            inCenter.state = inCenter.state == "show" ? "hide" : "show"
            inBottom.state = inBottom.state == "show" ? "hide" : "show"
            inTop.state=="show" ? burger.burgerClicked(true) : burger.burgerClicked(false)
        }
    }

}
