import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3

ApplicationWindow{
    id: viewwew
    width: 1280
    height: 800
    color: "#626262"
    title: "Settings"
    //    visible: false

    property int widthRectRepeater: 250
    property int heightRectRepeater: 50

    function getTimeAndDate()
    {
        startWindowDateText.text = Qt.formatDateTime(new Date(), "dd.MM.yyyy")
        startWindowHourAndMinutsText.text = Qt.formatTime(new Date(), "hh:mm")
        //        print(Qt.formatDateTime(new Date(), "dd.MM.yyyy"))
    }

    function showing()
    {
        //viewwewGridLayout.columns = mainClass.getCountTargets()
        viewwewRepeater.model = mainClass.getCountTargets()
        viewwewRow.width = (widthRectRepeater + viewwewRow.spacing) * viewwewRepeater.model
    }

    signal signalViewwewExit

    WidgetViewWindowTraining {
        id: viewWindowTraining
        anchors.fill: parent
        anchors.rightMargin: 189
        anchors.bottomMargin: 130
        anchors.leftMargin: 175
        anchors.topMargin: 202

    }

    Rectangle {
        id: startWindowTime
        width: parent.width
        height: 70
        color: "#404040"
        border.color: "#404040"
        border.width: 0
        anchors.top: parent.top
        Timer {
            id: startWindowTimer
            interval: 1000
            repeat: true
            running: true

            onTriggered: {
                getTimeAndDate()
            }
        }

        Rectangle {
            id: startWindowTimeHourAndMinuts
            width: 180
            height: parent.height / 2
            color: "#00000000"
            anchors.right: parent.right
            anchors.top: parent.top
            Text {
                id: startWindowHourAndMinutsText
                width: 180
                height: 35
                color: "#ffffff"
                text: ""
                anchors.verticalCenter: startWindowTimeHourAndMinuts.verticalCenter
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                anchors.horizontalCenter: startWindowTimeHourAndMinuts.horizontalCenter
                font.family: "Calibri"
            }
        }

        Rectangle {
            id: startWindowDate
            width: 180
            height: parent.height / 2
            color: "#00000000"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            Text {
                id: startWindowDateText
                width: 180
                height: 35
                color: "#ffffff"
                text: ""
                anchors.verticalCenter: startWindowDate.verticalCenter
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignTop
                anchors.horizontalCenter: startWindowDate.horizontalCenter
                font.family: "Calibri"
            }
        }

        Rectangle {
            id: startWindowHelp
            x: 0
            y: 0
            width: 86
            height: 70
            color: startWindowHelpMouse.containsMouse ? "#323232" : "transparent"
            MouseArea {
                id: startWindowHelpMouse
                anchors.fill: parent
                hoverEnabled: true
            }

            Text {
                id: startWindowHelpText
                color: "#ffffff"
                text: startWindowHelpMouse.containsMouse ? "X" : "?"
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: startWindowHelpMouse.containsMouse ? "Arial Unicode MS" : "Tahoma"
                font.pointSize: startWindowHelpMouse.containsMouse ? fontSizeHover : fontSize
                font.bold: startWindowHelpMouse.containsMouse ? false : true
            }
        }

        Rectangle {
            id: startWindowSettings
            x: 110
            y: 0
            width: 86
            height: 70
            color: startWindowSettingsMouse.containsMouse ? "#323232" : "transparent"
            Rectangle {
                id: startWindowSettingsRect
                width: startWindowSettingsMouse.containsMouse ? 55 : 50
                height: startWindowSettingsMouse.containsMouse ? 50 : 45
                color: "#00000000"
                anchors.verticalCenter: parent.verticalCenter
                Image {
                    id: startWindowSettingsImg
                    x: 0
                    y: 0
                    width: parent.width
                    height: parent.width
                    source: startWindowSettingsMouse.containsMouse ? "qrc:/pictures/Nastroiki.tif" : "qrc:/pictures/Big_Nastroiki.tif"
                }
                anchors.horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                id: startWindowSettingsMouse
                anchors.fill: parent
                hoverEnabled: true
            }
        }

        Rectangle {
            id: cyberMandarin
            x: 413
            y: 0
            width: 70
            height: 70
            color: "#00000000"
            Image {
                id: cyberMandarinImg
                width: 70
                height: 70
                source: "qrc:/pictures/Logo3.tif"
            }
        }

        Rectangle {
            id: cyberMandarinName
            x: 500
            y: 0
            width: 338
            height: 70
            color: "#00000000"
            Image {
                id: image
                x: 0
                y: 15
                width: 257
                height: 40
                source: "qrc:/pictures/Cyber.tif"
            }
        }

        Rectangle {
            id: startWindowStick
            x: 85
            y: 0
            width: 25
            height: 70
            color: "#00000000"
            Rectangle {
                x: 12
                y: 12
                width: 1
                height: 50
                color: "#ffffff"
            }
        }
    }

    Row {
        id: viewwewRow

        anchors.horizontalCenter: parent.horizontalCenter
        y: 99

        height: heightRectRepeater
        spacing: 30

        Repeater{
            anchors.fill: parent
            id: viewwewRepeater
            //            anchors.fill: parent
            //            model: countTargets
            Rectangle{
                id: rectReapeater
                height: parent.height
                width: widthRectRepeater
                color: "transparent"

                Image {
                    anchors.fill: parent
                    //          fillMode: Image.PreserveAspectCrop
                    source: "qrc:/picturesTrainingWindow/Mishen_ne_aktiv.tif"

                }

                Text {
                    id: parameterstrainingText
                    anchors.fill: parent
                    text: qsTr("Мишень " + (index+1))
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    //                fontSize
                    font.pointSize: 22/*parametersTrainingMouse.containsMouse ? fontSizeHover : fontSize*/
                    font.family: "Calibri"
                    //font.bold: parametersTrainingMouse.containsMouse ? true : false
                    color: "white"
                }

                MouseArea{
                    anchors.fill: parent

                    onClicked: {
                        color = "green"
                    }
                }
            }
//            Component.onCompleted: {
//                console.log(model, "23123123")
//            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
