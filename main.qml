import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15


import "pages"
import "components"
import "config"

Window {
    id: window
    width: 412 - 70
    height: 732 -70
    visible: true
    title: qsTr("Hello World")
    color: Config.bg_color

    StackView {
        id: stackView
        initialItem: startPage
        anchors.fill: parent
        pushEnter: Transition {
            PropertyAnimation {
                property: "x"
                easing.type: Easing.OutQuad
                from: window.width
                to:0
                duration: 200
            }
        }
    }

    StartPage {
        id: startPage
        width: parent.width
        visible: true
        onMainFeelClicked: {
            stackView.push(mainPage)
        }
    }

    MainPage {
        id: mainPage
        visible: false
        width: parent.width
        height: parent.height
        onToBackClicked: {
            stackView.pop()
        }
    }

}

