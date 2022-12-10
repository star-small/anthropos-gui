import QtQuick 2.15

Item {
    property string feelColor: 'grey'
    width:70
    height: width
    Rectangle {
        color: feelColor
        anchors.fill: parent
        radius: 100
    }
}
