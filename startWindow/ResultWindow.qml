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

    property int scaleTimeText: 30
    property int speedTimeText: 1

    property var imageRecord: "qrc:/Rezultaty/Play.tif"

    property bool flagPlayPause: false

    property int fontSize: 20

    property int paddingInfoText: 40

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
            border.width: 0
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
                width: 86
                height: parent.height
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

//            Rectangle {
//                id: startWindowSettings
//                x: 110
//                y: 0
//                width: 86
//                height: 70
//                color: startWindowSettingsMouse.containsMouse ? "#323232" : "transparent"
//                Rectangle {
//                    id: startWindowSettingsRect
//                    width: startWindowSettingsMouse.containsMouse ? 55 : 50
//                    height: startWindowSettingsMouse.containsMouse ? 50 : 45
//                    color: "#00000000"
//                    anchors.verticalCenter: parent.verticalCenter
//                    Image {
//                        id: startWindowSettingsImg
//                        x: 0
//                        y: 0
//                        width: parent.width
//                        height: parent.width
//                        source: startWindowSettingsMouse.containsMouse ? "qrc:/pictures/Nastroiki.tif" : "qrc:/pictures/Big_Nastroiki.tif"
//                    }
//                    anchors.horizontalCenter: parent.horizontalCenter
//                }

//                MouseArea {
//                    id: startWindowSettingsMouse
//                    anchors.fill: parent
//                    hoverEnabled: true
//                }
//            }

            //            Rectangle {
            //                id: cyberMandarin
            //                x: 413
            //                y: 0
            //                width: 70
            //                height: 70
            //                color: "#00000000"
            //                Image {
            //                    id: cyberMandarinImg
            //                    width: 70
            //                    height: 70
            //                    source: "qrc:/pictures/Logo3.tif"
            //                }
            //            }

            //            Rectangle {
            //                id: cyberMandarinName
            //                x: 500
            //                y: 0
            //                width: 338
            //                height: 70
            //                color: "#00000000"
            //                Image {
            //                    id: image
            //                    x: 0
            //                    y: 15
            //                    width: 257
            //                    height: 40
            //                    source: "qrc:/pictures/Cyber.tif"
            //                }
            //            }

            Rectangle {
                id: startWindowStick
                x: 85
                y: 0
                width: 25
                height: parent.height
                color: "#00000000"
                Rectangle {
                    anchors.centerIn: parent
                    width: 1
                    height: parent.height - 20
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
                    startWindow.show()
                    resultWindow.hide()
                }
            }

            Image {
                id: startWindowExitImg
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width - 50
                height: parent.height - 15
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
                source: "qrc:/Rezultaty/WindowFullInfo.tif"
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
                    border.width: 0
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
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Процент поражения мишеней"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Время первого попадания"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Количество попаданий"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Зона наибольшей плотности попаданий"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Самая поразительная мишень"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Самая невзрачная мишень"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "69%"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "0:12"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "228"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "ФП"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "Мишень 2"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "Мишень 1"
                        font.pixelSize: fontSize
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
                        font.pixelSize: fontSize
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
                //                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Количество мишеней"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Высота полета мишеней"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Дальность до мишеней от рубежа"
                        font.pixelSize: fontSize
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
                        anchors.verticalCenter: parent.verticalCenter
                        leftPadding: resultWindow.paddingInfoText
                        text: "Количество стрелков"
                        font.pixelSize: fontSize
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
                //                        font.pixelSize: fontSize
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
                //                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "255"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "322 м"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "71 м"
                        font.pixelSize: fontSize
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
                        anchors.left: parent.left
                        text: "21"
                        font.pixelSize: fontSize
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
                //                        font.pixelSize: fontSize
                //                        //                        font.overline: true
                //                        verticalAlignment: Text.AlignVCenter
                //                        horizontalAlignment: Text.AlignHCenter
                //                        color: "white"
                //                    }
                //                }
            }
        }

        //изменение масштаба и скорости воспроизведения
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
                    border.width: 0
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
                        font.pixelSize: fontSize
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
                            color: slider.pressed ? "#f0f0f0" : "#f6f6f6"
                            border.color: "#bdbebf"
                        }

                        onValueChanged: {
                            scaleTimeText = value
                            //                            widgetShootingTargetAll.currentScaleTime = value
                            //                            widgetShooting.currentScaleTime = value
                        }
                    }
                }

                GridScale {
                    id: scaleTimeSlider
                    Layout.column: 1
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 2

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: scaleTimeText
                        font.pixelSize: fontSize
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }

                GridScale {
                    id: timeRecordTraining
                    Layout.column: 2
                    Layout.row: 1
                    Layout.columnSpan: 2
                    Layout.rowSpan: 2

                    Text {
                        anchors.centerIn: parent
                        text: "00:21"
                        font.pixelSize: fontSize
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }
                }

                GridScale {
                    id: speedSliderText
                    Layout.column: 4
                    Layout.row: 0
                    Layout.columnSpan: 2
                    Layout.rowSpan: 2

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        text: "Скорость воспроизведения x " + speedTimeText
                        font.pixelSize: fontSize
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        color: "white"
                    }

                }
                GridScale {
                    id: speedSlider
                    Layout.column: 5
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 2

                    Slider{
                        id: controlsSpeedSlider
                        anchors.fill: parent
                        orientation: Qt.Horizontal
                        value: 1
                        from: 1
                        to: 4
                        stepSize: 1
                        //                        scale: 0.8

                        handle: Rectangle {
                            x: controlsSpeedSlider.leftPadding + controlsSpeedSlider.visualPosition * (controlsSpeedSlider.availableWidth - width)
                            y: controlsSpeedSlider.topPadding + controlsSpeedSlider.availableHeight / 2 - height / 2
                            implicitWidth: 16
                            implicitHeight: 16
                            radius: 8
                            color: controlsSpeedSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                            border.color: "#bdbebf"
                        }

                        onValueChanged: {
                            speedTimeText = value
                            //                            widgetShootingTargetAll.currentScaleTime = value
                            //                            widgetShooting.currentScaleTime = value
                        }
                    }
                }

                GridScale {
                    id: buttonStartRecord
                    Layout.column: 4
                    Layout.row: 2
                    Layout.columnSpan: 1
                    Layout.rowSpan: 2

                    Image {
                        id: imgRecord
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.right: parent.right
                        source: "qrc:/Rezultaty/Play.tif"
                        MouseArea{
                            anchors.fill: parent

                            onClicked: {
                                imgRecord.source = flagPlayPause ? "qrc:/Rezultaty/Pause.tif" : "qrc:/Rezultaty/Play.tif"
                                flagPlayPause = !flagPlayPause
                                //                                print(flagPlayPause)
                            }
                        }
                    }
                }
            }
        }

//        property type name: value
        function nameTargets(index)
        {

        }

        //Список мишеней с общим timeLine
        GridRectangle{
            id: targetsAndGeneralTimeLine
            Layout.column: 1
            Layout.row: 15
            Layout.columnSpan: 15
            Layout.rowSpan: 6
            Layout.rightMargin: 20
            Layout.leftMargin: 20
            Layout.bottomMargin: 5

            ScrollView{
                id: scrollTargets
                anchors.fill: parent
                height: parent.height
                width: parent.width
                contentWidth: parent.width
                contentHeight: 8 * (10 + widgetShooting.height)
                clip: true

                Column{
//                    anchors.verticalCenter: parent.verticalCenter
                    anchors.fill: parent
                    anchors.left: parent.left
                    spacing: 10
                    Repeater{
                        id: repWidgetShooting
                        anchors.fill: parent
                        model: 4/*mainClass.getCountTargets()*/

                        WidgetShooting{
                            id: widgetShooting
                            width: parent.width

                            Component.onCompleted: {
                                widgetShooting.setNameWidget("Мишень " + index)
                            }

                        }
                    }
                }           
            }
        }
    }
}
