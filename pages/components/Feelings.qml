import QtQuick 2.15
Item {
    id: root
    property int widthSq: 30
    property int spaces: 20
    width: listModel.count * widthSq + (listModel.count * spaces)
    height: widthSq
    Rectangle {
        id: rect
        color: "blue"
        anchors.fill: parent

        ListModel {
            id: listModel
            ListElement {color: "red"}
            ListElement {color: "orange"}
            ListElement {color: "yellow"}
            ListElement {color: "lime"}
            ListElement {color: "green"}
        }
        GridView {
            anchors.fill: parent
            model: listModel
            cellWidth: widthSq + spaces

            delegate: Feeling {
                width: widthSq
                feelColor: modelData
            }
        }
    }
}
