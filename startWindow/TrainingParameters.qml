import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4


ApplicationWindow {
    id: trainingParameters
    width: 640
    height: 480

    color: "#7f7f7f"
    title: "TrainingParameters"
    //    visible: false

    signal signalTrainingParametersExit

    Rectangle {
        id: trainingParametersTool
        x: 0
        y: 0
        width: parent.width
        height: 23
        color: "#404040"

        Rectangle {
            x: 240
            y: 0
            width: 160
            height: 23
            color: "#00000000"

            Text {
                id: trainingParametersText
                x: 0
                y: 0
                width: 160
                height: 23
                color: "#ffffff"
                text: qsTr("Параметры тренировки")
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Rectangle {
            x: 617
            y: 0
            width: 23
            height: 23
            color: "#00000000"

            Image {
                id: trainingParametersImg
                width: 23
                height: 23
                source: "qrc:/pictures/Close_okno_nastroek.tif"
                fillMode: Image.PreserveAspectFit
            }
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true

                onClicked: {
                    trainingParameters.hide()
                    //                    startWindow.show()

                }
            }
        }
    }

    Row{
        id: trainingParametersRowFlyTargets
        x: 123
        y: 147
        width: 358
        height: 40
        spacing: 10

        Rectangle {
            width: 250
            height: 40
            color: "#00000000"

            Text {
                id: name
                x: 0
                y: 0
                width: 250
                height: 40
                color: "#ffffff"
                text: qsTr("Высота полета мишеней")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 16
            }
        }

        Rectangle {
            id: rectangle7
            width: 200
            height: 40
            color: "#00000000"

            TextField {
                id: textField
                x: 100
                y: 0
                width: 100
                height: 40
                placeholderText: qsTr("322")

                font.pointSize: 14
                layer.enabled: false
                anchors.rightMargin: 6
                //            placeholderText: qsTr("11")
                color: "#ffffff"
                background: Rectangle{

                    border.color: "white"
                    color: "#595959"
                }
            }
        }

    }

    Row {
        id: trainingParametersRowFlyTargets1
        x: 123
        y: 200
        width: 420
        height: 40
        spacing: 10
        Rectangle {
            width: 350
            height: 40
            color: "#00000000"
            Text {
                id: name1
                x: 0
                y: 0
                width: 350
                height: 40
                color: "#ffffff"
                text: qsTr("Дальность до мишеней на рубеже")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 16
            }
        }

        Rectangle {
            id: rectangle6
            width: 100
            height: 40
            color: "#00000000"

            TextField {
                id: textField1
                x: 0
                y: 0
                width: 100
                height: 40
                color: "#ffffff"
                background: Rectangle {
                    color: "#595959"
                    border.color: "#ffffff"
                }
                placeholderText: qsTr("322")
                layer.enabled: false
                anchors.rightMargin: 6
                font.pointSize: 14
            }
        }
    }

    Row {
        id: trainingParametersRowFlyTargets2
        x: 123
        y: 253
        width: 459
        height: 40
        spacing: 5
        Rectangle {
            id: rectangle2
            width: 250
            height: 40
            color: "#00000000"
            Text {
                id: name2
                x: 0
                y: 0
                width: 250
                height: 40
                color: "#ffffff"
                text: qsTr("Количество мишеней")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 16
            }
        }

        Rectangle {
            id: rectangle4
            width: 200
            height: 40
            color: "#00000000"

            TextField {
                id: textField2
                x: 105
                y: 0
                width: 100
                height: 40
                color: "#ffffff"
                background: Rectangle {
                    color: "#595959"
                    border.color: "#ffffff"
                }
                placeholderText: qsTr("322")
                layer.enabled: false
                anchors.rightMargin: 6
                font.pointSize: 14
            }
        }
    }

    Row {
        id: trainingParametersRowFlyTargets3
        x: 123
        y: 307
        width: 459
        height: 40
        spacing: 10
        Rectangle {
            id: rectangle3
            width: 250
            height: 40
            color: "#00000000"
            Text {
                id: name3
                x: 0
                y: 0
                width: 250
                height: 40
                color: "#ffffff"
                text: qsTr("Количество стрелков")
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 16
            }
        }

        Rectangle {
            id: rectangle5
            width: 200
            height: 40
            color: "#00000000"

            TextField {
                id: textField3
                x: 100
                y: 0
                width: 100
                height: 40
                color: "#ffffff"
                anchors.right: parent.right
                background: Rectangle {
                    color: "#595959"
                    border.color: "#ffffff"
                }
                placeholderText: qsTr("322")
                layer.enabled: false
                anchors.rightMargin: 0
                font.pointSize: 14
            }
        }
    }

    Rectangle {
        id: buttomTrainingParametersSave
        x: 240
        y: 369
        width: 160
        height: 40
        color: "transparent"

        Image {
            id: buttomTrainingParametersSaveImg
            x: 0
            y: 0
            width: 123
            height: 40
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            source: "qrc:/pictures/Nastoriki_knopka_primenit.tif"
            anchors.horizontalCenter: parent.horizontalCenter
            //                fillMode: Image.PreserveAspectFit
        }

        Text {
            id: buttomTrainingParametersSaveText
            x: 0
            y: 0
            width: 123
            height: 40
            color: "#ffffff"
            text: "Применить"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea{
            id: buttomTrainingParametersSaveMouse
            anchors.fill: parent

            hoverEnabled: true

            onClicked: {
                //                settingsWindow.close()
                //                startWindow.show()
                //                fileDialog.open()
            }

        }
    }
}
