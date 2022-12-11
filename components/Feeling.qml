import QtQuick 2.15

Item {
    property string feelColor: 'grey'
    width:200
    height: width
    Rectangle {
        id: rect
        color: feelColor
        anchors.fill: parent
        radius: 100
    }
}
