import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import QtQuick.Layouts 1.15

import "./startWindow"

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("MSTK929")
    //    flags: Qt.FramelessWindowHint
    property var textTime: ""

    Component.onCompleted: {
        mainClass.getDate()
        mainClass.getTime()



    }

    //    Rectangle {
    //        Text {
    //            id: name
    //            text: textTime
    //        }

    //        //        Transition




    //    }

    //    function log(number_1) {
    //        console.log(number_1)
    //    }

    signal changedWidthSignal(var newWidth, var newXPosition)
    property var sizeRectangleCurrent: 0

    //    Component.onCompleted: {
    //        changedWidthSignal.connect(window.log)
    //    }

    //    Timer {
    //        id: timerRect
    //        property int count: -1
    //        property int xRow: 0
    //        interval: 500
    //        running: true
    //        repeat: true

    //        onTriggered: {
    //            var rectCreator = Qt.createComponent("RectGreen.qml")

    //            timerRect.count = timerRect.count + 1

    //            timerRect.xRow = (sizeRectangleCurrent * timerRect.count);

    //            var Rect = rectCreator.createObject(row,
    //                                                {
    //                                                    x: timerRect.xRow,
    //                                                    countText: timerRect.count,
    //                                                    colorChange: Qt.rgba(0.0, 1.0, 0.0 , 0.5),
    //                                                    dfltWidth: sizeRectangleCurrent
    //                                                });

    //            changedWidthSignal.connect(Rect.setWidthRectGreen)
    ////            print(timerRect.count)
    //        }
    //    }

    Rectangle{
        id: windowRect
        //        y: 0
        height: 40
        width: window.width - 100
        anchors.horizontalCenter: parent.horizontalCenter
        color: "red"

        ScrollView {
            id: scroll
            height: 40
            wheelEnabled: true
            hoverEnabled: true
            width: parent.width
            contentWidth: timerRect.xRow
            contentHeight: row.height
            ScrollBar.horizontal.position: timerRect.count + 1
            clip: true
            //            ScrollBar.horizontal: ScrollBar{

            //                parent: scroll.parent
            //                anchors.top: scroll.top
            //                anchors.left: scroll.right
            //                anchors.bottom: scroll.bottom
            //                anchors.right: scroll.right

            ////                MouseArea{
            ////                    anchors.fill: parent

            ////                    onPressed: {
            ////                        print("onPressd")
            ////                    }
            //                //}
            //            }



            //            MouseArea{
            //                anchors.fill:

            //                onPressed: {
            //                    console.log("onPressed")
            //                }
            //            }






            Flickable {
                interactive: false
            }

            //Flickable.flickableDirection: Flickable.HorizontalFlick
            //            Flickable.flickableDirection: Flickable.VerticalFlick





            //            moving: false
            //Flickable.moving: false
            //ScrollBar.horizontal.interactive: false
            //ScrollBar.horizontal.pressed: false
            //        ScrollBar.interactive: false
            //        enabled: false
            Row{
                id: row
            }

            //            Label {
            //                     text: "ABC"
            //                     font.pixelSize: 224
            //                 }
        }
    }
    //    }

    StartWindow{
        id: startWindow

        onSignalExit: {
            startWindow.close()
            window.show()
        }
    }





    Rectangle{
        y: 50
        width: 100
        height: 100
        color: "red"
        MouseArea{
            id: area
            anchors.fill: parent

            onClicked: {
                //                timerRect.running = !timerRect.running

                startWindow.show()
                window.hide()
                mainClass.startTimerGeneral()

                //                var placeMent

                //                var rectCreator = Qt.createComponent("RectGreen.qml")
                //                var Rect = rectCreator.createObject(parent, {x: mouseX, y: mouseY});
            }
        }
    }

    //    Grid {
    //        x: 171
    //        y: 183
    //        layoutDirection: Qt.LeftToRight
    //        flow: Grid.TopToBottom
    //        rows: 0
    //        verticalItemAlignment: Grid.AlignVCenter
    //        horizontalItemAlignment: Grid.AlignHCenter
    //        columns: 3
    //        spacing: 2
    //        Rectangle { color: "red"; width: 50; height: 50 }
    //        Rectangle { color: "green"; width: 20; height: 50 }
    //        Rectangle { color: "blue"; width: 50; height: 20 }
    //        Rectangle { color: "cyan"; width: 50; height: 50 }
    //        Rectangle { color: "magenta"; width: 10; height: 10 }
    //    }


    Slider {
        id: slider
        x: 106
        y: 50
        width: 430
        height: 40
        value: 30
        from: 30
        to: 120

        stepSize: 15

        //        onMoved: {
        //            //console.log("work")
        //            window.changedWidthSignal(
        //                                        1 * (window.width / slider.value),
        //                                        timerRect.xRow
        //                                      )

        //            label.text = window.width / slider.value
        ////            label1.text =
        //        }

        onValueChanged: {
            sizeRectangleCurrent = windowRect.width / slider.value

            window.changedWidthSignal(sizeRectangleCurrent, timerRect.xRow)

            //scroll.contentWidth = timerRect.count * sizeRectangleCurrent
        }

        Component.onCompleted: {
            sizeRectangleCurrent = windowRect.width / slider.value


        }


        //        Component.onCompleted: {
        //            console.log("Component.onCompleted")
        //            slider.moved.connect(window.changedWidthSignal)
        //        }
    }

    Label {
        id: label
        x: 106
        y: 96
        width: 117
        height: 35
        text: qsTr("Label")

        Component.onCompleted: {
            label.text = window.width / slider.value
        }

        Label {
            id: label1
            x: 127
            y: 0
            width: 102
            height: 38
            text: qsTr("Label")
        }
    }

    //    Grid {
    //        id: grid
    //        x: 50
    //        y: 352
    //        width: 111
    //        height: 61
    //        transformOrigin: Item.Center
    //        spacing: 2
    //        horizontalItemAlignment: Grid.AlignHCenter
    //        rows: 1
    //        columns: 2

    //        Rectangle {
    //            id: rectangle
    //            width: 20
    //            height: 20
    //            color: "#ffffff"
    //        }

    //        Rectangle {
    //            id: rectangle1
    //            width: 20
    //            height: 20
    //            color: "#ffffff"
    //        }

    //        Rectangle {
    //            id: rectangle2
    //            width: 20
    //            height: 20
    //            color: "#ffffff"
    //        }
    //    }

    //    MouseArea {
    //        anchors.fill: parent
    //        acceptedButtons: Qt.LeftButton | Qt.RightButton
    //        onClicked: {

    //                    if (mouse.button == Qt.RightButton)
    //                    {
    //                        cff += 10
    //                        scroll.contentWidth = timerRect.count * cff
    //                        console.log(scroll.contentWidth)
    ////                        event.accepted = true
    //                    }


    //                    if (mouse.button == Qt.LeftButton)
    //                    {
    //                        cff -= 10
    //                        scroll.contentWidth = timerRect.count * cff
    //                        console.log(scroll.contentWidth)
    ////                        event.accepted = true
    //                    }
    //        }
    //    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
