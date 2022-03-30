import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12

import "../"

ApplicationWindow {
    id: resultWindow
    width: 1280
    height: 800
    //    visible: true
    title: "Result Window"
    color: "#626262"

    //    flags: Qt.FramelessWindowHint

    signal signalExitResultWindow

    GridLayout{
        id: grid
        anchors.fill: parent
        //        anchors.verticalCenter: parent.verticalCenter
        //        anchors.horizontalCenter: parent.horizontalCenter
        // columnSpacing: 15
        columns: 16
        rows: 22

        component GridRectangle : Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.preferredWidth: Layout.columnSpan
            Layout.preferredHeight: Layout.rowSpan
            color: "#626262"
            border.color: Qt.darker(color)
            border.width: 1
            //Layout.margins: 20
        }

        //toolbar(доделать)
        GridRectangle{
            id: toolBarResult
            Layout.column: 1
            Layout.row: 0
            Layout.columnSpan: 15
            Layout.rowSpan: 2

            color: "#404040"
            anchors.right: parent.right
            anchors.top: parent.top
            Text {
                id: startWindowHourAndMinutsText
                width: 180
                height: 35
                color: "green"
                anchors.verticalCenter: startWindowTimeHourAndMinuts.verticalCenter
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignBottom
                font.family: "Calibri"
                anchors.horizontalCenter: startWindowTimeHourAndMinuts.horizontalCenter
            }

            Rectangle {
                id: startWindowDate
                width: 180
                height: resultWindow / 2
                color: "red"
                anchors.right: resultWindow.right
                anchors.bottom: resultWindow.bottom
                Text {
                    id: startWindowDateText
                    width: 180
                    height: 35
                    color: "#ffffff"
                    anchors.verticalCenter: startWindowDate.verticalCenter
                    font.pixelSize: 22
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignTop
                    font.family: "Calibri"
                    anchors.horizontalCenter: startWindowDate.horizontalCenter
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
                    font.bold: startWindowHelpMouse.containsMouse ? false : true
                    font.pointSize: startWindowHelpMouse.containsMouse ? fontSizeHover : fontSize
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

        //button exit
        GridRectangle{
            id: buttonExit
            Layout.column: 1
            Layout.row: 2
            Layout.columnSpan: 2
            Layout.rowSpan: 2
            //            Layout.padding: 1
            Layout.leftMargin: 20
            color: "transparent"

            MouseArea{
                id: startWindowExitMouse
                anchors.fill: parent

                hoverEnabled: true

                onClicked: {
                    Qt.quit()
                }
            }

            Image {
                id: startWindowExitImg
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width
                height: parent.height
                source: "qrc:/pictures/Vyhod.tif"
                //            fillMode: Image.PreserveAspectFit

            }
            Text {
                id: startWindowExitText
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "Выйти"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 20/*startWindowExitMouse.containsMouse ? fontSizeHover : fontSize*/
                color: "#ffffff"
            }
        }

        //label date and time training
        GridRectangle{
            id: labelDateTimeTraining
            Layout.column: 7
            Layout.row: 2
            Layout.columnSpan: 5
            Layout.rowSpan: 2

            Text {
                text: "Тренировка " + mainClass.getDate() + " (" + mainClass.getTime() + ")"
                wrapMode: Text.WrapAnywhere
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#ffffff"
                font.pixelSize: 20

            }
        }

        // duration Training
        GridRectangle{
            id: durationTraining
            Layout.column: 13
            Layout.row: 2
            Layout.columnSpan: 3
            Layout.rowSpan: 2
            Layout.rightMargin: 20

            Text {
                text: "Длительность: "
                wrapMode: Text.WrapAnywhere
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#ffffff"
                font.pixelSize: 20
            }
        }

        //обобщенные результаты тренировки
        GridRectangle{
            id: generalInfoResult
            Layout.column: 1
            Layout.row: 4
            Layout.columnSpan: 15
            Layout.rowSpan: 9
            Layout.rightMargin: 20
            Layout.leftMargin: 20

            Image {
                anchors.fill: parent
                source: "qrc:/Rezultaty/Okno_full_infy.tif"
            }

            GridLayout{
                id: gridGeneralInfo
                anchors.fill: parent
                columns: 8
                rows: 7

                component GridLabel: Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: Layout.columnSpan
                    Layout.preferredHeight: Layout.rowSpan
                    color: "#00000000"
                    border.width: 1
                    border.color: "white"
                    //Layout.margins: 20
                }


                //1
                GridLabel{
                    Layout.column: 0
                    Layout.row: 0
                    Layout.columnSpan: 4
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "ОБОБЩЕННАЯ ИНФОРМАЦИЯ"
                        font.pixelSize: 14
                        font.underline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 0
                    Layout.row: 1
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Процент поражения мишеней"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 0
                    Layout.row: 2
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Время первого попадания"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 0
                    Layout.row: 3
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Количество попаданий"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 0
                    Layout.row: 4
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Зона наибольшей плотности попаданий"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 0
                    Layout.row: 5
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Самая поразительная мишень"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 0
                    Layout.row: 6
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Самая невзрачная мишень"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }

                //2
                GridLabel{
                    Layout.column: 3
                    Layout.row: 1
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "69%"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 3
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "0:12\tМишень 5"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 3
                    Layout.row: 3
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "228"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 3
                    Layout.row: 4
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "ФП"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 3
                    Layout.row: 5
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Мишень 2"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 3
                    Layout.row: 6
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Мишень 1"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }

                //3
                GridLabel{
                    Layout.column: 4
                    Layout.row: 0
                    Layout.columnSpan: 4
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "ПАРАМЕТРЫ ТРЕНИРОВКИ"
                        font.pixelSize: 14
                        font.underline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                //                GridLabel{
                //                    Layout.column: 4
                //                    Layout.row: 1
                //                    Layout.columnSpan: 3
                //                    Layout.rowSpan: 1

                //                    Text {
                //                        anchors.centerIn: parent
                //                        text: "Самая невзрачная мишень"
                //                        font.pixelSize: 14
                //                        //                        font.overline: true
                //                        verticalAlignment: Text.AlignVCenter
                //                        horizontalAlignment: Text.AlignHCenter
                //                        color: "white"
                //                    }
                //                }
                GridLabel{
                    Layout.column: 4
                    Layout.row: 2
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Количество мишеней"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 4
                    Layout.row: 3
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Высота полета мишеней"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 4
                    Layout.row: 4
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Дальность до мишеней от рубежа"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 4
                    Layout.row: 5
                    Layout.columnSpan: 3
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "Количество стрелков"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                //                GridLabel{
                //                    Layout.column: 4
                //                    Layout.row: 6
                //                    Layout.columnSpan: 3
                //                    Layout.rowSpan: 1

                //                    Text {
                //                        anchors.centerIn: parent
                //                        text: "Самая невзрачная мишень"
                //                        font.pixelSize: 14
                //                        //                        font.overline: true
                //                        verticalAlignment: Text.AlignVCenter
                //                        horizontalAlignment: Text.AlignHCenter
                //                        color: "white"
                //                    }
                //                }


                //4~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                //                GridLabel{
                //                    Layout.column: 7
                //                    Layout.row: 1
                //                    Layout.columnSpan: 1
                //                    Layout.rowSpan: 1

                //                    Text {
                //                        anchors.centerIn: parent
                //                        text: "Самая невзрачная мишень"
                //                        font.pixelSize: 14
                //                        //                        font.overline: true
                //                        verticalAlignment: Text.AlignVCenter
                //                        horizontalAlignment: Text.AlignHCenter
                //                        color: "white"
                //                    }
                //                }
                GridLabel{
                    Layout.column: 7
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "255"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 7
                    Layout.row: 3
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "322 м"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 7
                    Layout.row: 4
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "71 м"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                GridLabel{
                    Layout.column: 7
                    Layout.row: 5
                    Layout.columnSpan: 1
                    Layout.rowSpan: 1

                    Text {
                        anchors.centerIn: parent
                        text: "21"
                        font.pixelSize: 14
                        //                        font.overline: true
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }
                //                GridLabel{
                //                    Layout.column: 7
                //                    Layout.row: 6
                //                    Layout.columnSpan: 1
                //                    Layout.rowSpan: 1

                //                    Text {
                //                        anchors.centerIn: parent
                //                        text: "Самая невзрачная мишень"
                //                        font.pixelSize: 14
                //                        //                        font.overline: true
                //                        verticalAlignment: Text.AlignVCenter
                //                        horizontalAlignment: Text.AlignHCenter
                //                        color: "white"
                //                    }
                //                }
            }
        }

        GridRectangle{
            id: scaleAndSpeed
            Layout.column: 1
            Layout.row: 13
            Layout.columnSpan: 15
            Layout.rowSpan: 2
            Layout.rightMargin: 20
            Layout.leftMargin: 20

            GridLayout{
                id: gridScaleAndSpeed

                anchors.fill: parent
                columns: 6
                rows: 4

                component GridScale: Rectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.preferredWidth: Layout.columnSpan
                    Layout.preferredHeight: Layout.rowSpan
                    color: "#626262"
                    border.color: Qt.darker(color)
                    border.width: 1
                    //Layout.margins: 20
                }

                GridScale {
                    id: scaleLabel
                    Layout.column: 0
                    Layout.row: 0
                    Layout.columnSpan: 1
                    Layout.rowSpan: 2

                    Text {
                        text: "Масштаб времени"
                        anchors.verticalCenter: parent.verticalCenter
                        font.pixelSize: 14
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }

                GridScale {
                    id: scaleSlider
                    Layout.column: 0
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 2

                    Slider{
                        id: slider
                        anchors.fill: parent
                        orientation: Qt.Horizontal
                        value: 30
                        from: 30
                        to: 120
                        stepSize: 15
//                        scale: 0.8

                        handle: Rectangle {
                            x: slider.leftPadding + slider.visualPosition * (slider.availableWidth - width)
                            y: slider.topPadding + slider.availableHeight / 2 - height / 2
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 8
                            color: control.pressed ? "#f0f0f0" : "#f6f6f6"
                            border.color: "#bdbebf"
                        }

                        onValueChanged: {
                            //                            widgetShootingTargetAll.currentScaleTime = value
                            //                            widgetShooting.currentScaleTime = value
                        }
                    }
                }

                GridScale {
                    Layout.column: 1
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 2
                }


                GridScale {
                    Layout.column: 2
                    Layout.row: 1
                    Layout.columnSpan: 2
                    Layout.rowSpan: 2
                }

                GridScale {
                    Layout.column: 4
                    Layout.row: 0
                    Layout.columnSpan: 2
                    Layout.rowSpan: 2
                }
                GridScale {
                    Layout.column: 4
                    Layout.row: 2
                    Layout.columnSpan: 2
                    Layout.rowSpan: 2
                }
            }


            //            Layout.margins: 20
            //            color: "gray"
        }
        GridRectangle{
            id: rect7
            Layout.column: 1
            Layout.row: 15
            Layout.columnSpan: 15
            Layout.rowSpan: 6
            Layout.rightMargin: 20
            Layout.leftMargin: 20
            Layout.bottomMargin: 5
            //            Layout.margins: 20
            //            color: "gray"
        }

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
