import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import "pages"


Window {
    id: window
    width: 412 - 70
    height: 732 -70
    visible: true
    title: qsTr("Hello World")
    color: "lightgrey"

    StackView {
        id: stackView
        initialItem: page1
        anchors.fill: parent
    }

    StartPage {
        id: page1
        width: parent.width
        height: parent.height
        onClickPressed: {
            stackView.push(secPage)
        }
    }

    FeelPage {
        id: secPage
        width: parent.width
        height: parent.height
        visible: false
    }
}

