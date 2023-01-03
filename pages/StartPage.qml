import QtQuick 2.15
import QtQml 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4 as Con
import QtQuick.Controls.Material 2.15
import "../components"
import "../config"
Item {
    id: root
    signal mainFeelClicked()

    FieldComponent {
        id: field
        anchors.centerIn: parent
    }

    Button {
        text: 'change'
        onClicked:  {
            Config.darkTheme = Config.darkTheme ? false : true
        }
        background: Frame {}
    }

    Button {
        id: btn
        width: name.width+10
        height: name.height+10
        anchors.top: field.bottom
        anchors.horizontalCenter: field.horizontalCenter
        anchors.topMargin: 20
        Text {
            id: name
            anchors.centerIn: parent
            text: qsTr("Отправить")
            color: Config.text_color
        }


        onPressed: {
            popup.open()
        }
        background: Frame {}
    }

    Popup {
        id: popup
        width: parent.width
        height: 50
        topMargin: parent.height/2 - 150
        modal: true
        focus: true
        topPadding: 0
        bottomPadding: 0
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
        }
        Text {
            id: txt
            text: qsTr("Оцените событие по этой шкале:")
            font.pixelSize: 13
            anchors.centerIn: parent
            color: Config.text_color
        }
        Scale {
            widthSq: parent.height
            parentWidth: parent.width
            anchors.top: txt.bottom
            anchors.topMargin: 20
            //spaces: 3
            width: parent.width
            onFeelClicked: (choose)=>{
                               popup.close()
                               root.mainFeelClicked()
                               mainFeelClicked()
                               console.log(choose)
                               database.inserIntoTable(choose, "general", Date().toLocaleString())
                               myModel.updateModel()
                           }
        }


    }
}
