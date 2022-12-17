import QtQuick 2.15

// State of User
Item {
    id: root
    property int widthSq: 10
    property int parentWidth: 0
    signal feelClicked(int choose)
    height: widthSq

    Rectangle {
        id: rect
        anchors.fill: parent
        color: "transparent"

        ListModel {
            id: listModel
            ListElement {color: "red"}
            ListElement {color: "orange"}
            ListElement {color: "yellow"}
            ListElement {color: "lime"}
            ListElement {color: "green"}
            ListElement {color: "pink"}

        }
        GridView {
            id: grid
            anchors.fill: parent
            model: listModel
            cellWidth: parentWidth/listModel.count
            interactive: false
            delegate:
                Rectangle {
                    height: widthSq
                    width: parentWidth/listModel.count
                    color: "transparent"
                    Feeling {
                    anchors.centerIn: parent
                    width: widthSq
                    feelColor: modelData
                    MouseArea {
                        anchors.fill: parent
                        onClicked: root.feelClicked(index)
                    }
                }
            }
        }
    }
}
