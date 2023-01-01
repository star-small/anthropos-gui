import QtQuick 2.15
import "../config"
Item {
    id: burger

    signal burgerClicked()
    property string btnColor
    property int thikness: height/5
    state: "show"
    Rectangle {
        id: inTop
        color: btnColor
        height: thikness
        width: parent.width
        state: parent.state
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
        state: parent.state
        //color: btnColor

        radius: 20
        states: [
            State {
                name: "show"
                PropertyChanges {
                    target: inCenter
                    color: inBottom.color
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
        state: parent.state
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
}
