import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3

ApplicationWindow{
    id: viewwew
    width: 640
    height: 480
    color: "#ea2626"
    title: "Settings"
    //    visible: false

    signal signalViewwewExit



    ViewWindowTraining{
        id: viewWindowTraining
        anchors.fill: parent
        anchors.leftMargin: 0
        anchors.topMargin: 97


    }

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 640
        height: 91
        color: "#00ff00"

        Text {
            id: text1
            x: 0
            y: 0
            width: 640
            height: 91
            text: qsTr("Text")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

}
