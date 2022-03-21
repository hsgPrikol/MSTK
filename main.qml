//import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.15

//import "./startWindow"

//Window {
//    id: window
//    width: 1280
//    height: 720
//    visible: true
//    title: qsTr("MSTK929")
//    //    flags: Qt.FramelessWindowHint
//    property var textTime: ""

//    property int testWidth: 22
//    property int testHeight: 40

//    property int  test: 1000

//    property int  test1: 40

//    property var cff: 22

//    Rectangle {
//        Text {
//            id: name
//            text: textTime
//        }

//        //        Transition

//        Timer {
//            id: timerRect
//            property int count: 0
//            property int xRow: 0
//            interval: 100
//            running: true
//            repeat: true

//            onTriggered: {
//                var rectCreator = Qt.createComponent("RectGreen.qml")
//                var Rect
//                if (timerRect.count % 9 == 0)
//                {
//                   Rect = rectCreator.createObject(row, {x: timerRect.xRow, countText: timerRect.count + 1, colorChange: "green", heightGreen: testHeight, widthGreen: testWidth});
//                }
//                else
//                {
//                   Rect = rectCreator.createObject(row, {x: timerRect.xRow, countText: timerRect.count + 1, colorChange: "transparent"});
//                }

//                timerRect.xRow +=cff
//                timerRect.count = timerRect.count + 1
//                print(timerRect.count)
//            }
//        }


//    }

//    ScrollView {
//        id: scroll
//        height: 40
//        width: window.width
//        contentWidth: timerRect.count * cff
//        contentHeight: row.height
//        ScrollBar.horizontal.position: timerRect.count + 1



//        //ScrollBar.horizontal.interactive: false
//        //ScrollBar.horizontal.pressed: false
//        //        ScrollBar.interactive: false
//        //        enabled: false
//        Row{
//            id: row
////            spacing: 2
//            width: parent.width
//            height: 40

////            Repeater{
////                id: repeat
////                //                model: timerRect.count
////                Rectangle{
////                    id: rect
////                    width: 40
////                    height: 40

////                    color: "green"

////                    Text {
////                        text: index+1
////                    }
////                }
//            }
//        }
////    }

//    StartWindow{
//        id: startWindow

//        onSignalExit: {
//            startWindow.close()
//            window.show()
//        }
//    }





//    Rectangle{
//        y: 50
//        width: 100
//        height: 100
//        color: "red"
//        MouseArea{
//            id: area
//            anchors.fill: parent

//            onClicked: {
//                timerRect.stop()




////                startWindow.show()
////                window.hide()

//                //                var placeMent

//                //                var rectCreator = Qt.createComponent("RectGreen.qml")
//                //                var Rect = rectCreator.createObject(parent, {x: mouseX, y: mouseY});
//            }
//        }
//    }

//    Slider {
//        id: slider
//        x: 279
//        y: 80
//        value: 0.5
//        from: 1
//        to: 100

//        onValueChanged: {
////            testHeight -=1
////            testWidth -=1
//            print(testHeight, testWidth)
//            if (test > 10 && test1 > 10)
//            {
//                test1 -=1
//                test -= 10
//            }
//            print(test)
//        }
//    }

////    MouseArea {
////        anchors.fill: parent
////        acceptedButtons: Qt.LeftButton | Qt.RightButton
////        onClicked: {

////                    if (mouse.button == Qt.RightButton)
////                    {
////                        cff += 10
////                        scroll.contentWidth = timerRect.count * cff
////                        console.log(scroll.contentWidth)
//////                        event.accepted = true
////                    }


////                    if (mouse.button == Qt.LeftButton)
////                    {
////                        cff -= 10
////                        scroll.contentWidth = timerRect.count * cff
////                        console.log(scroll.contentWidth)
//////                        event.accepted = true
////                    }
////        }
////    }
//}

///*##^##
//Designer {
//    D{i:0;formeditorZoom:0.9}
//}
//##^##*/

import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import "./startWindow"

Window {
    id: window
    width: 1280
    height: 720
    visible: true
    title: qsTr("MSTK929")
    //    flags: Qt.FramelessWindowHint
    property var textTime: ""



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

    Timer {
        id: timerRect
        property int count: -1
        property int xRow: 0
        interval: 100
        running: true
        repeat: true

        onTriggered: {
            var rectCreator = Qt.createComponent("RectGreen.qml")

            timerRect.count = timerRect.count + 1

            timerRect.xRow = ((sizeRectangleCurrent  + 5) * timerRect.count);

            var Rect = rectCreator.createObject(row,
                                                {
                                                    x: timerRect.xRow,
                                                    countText: timerRect.count,
                                                    colorChange: Qt.rgba(0.0, 1.0, 0.0 , 0.5),
                                                    dfltWidth: sizeRectangleCurrent
                                                });

            changedWidthSignal.connect(Rect.setWidthRectGreen)

//                if (timerRect.count % 9 == 0)
            //{
                //var Rect = rectCreator.createObject(row, {x: timerRect.xRow, countText: timerRect.count + 1, colorChange: "green"});
            //}
//                else
//                {
//                    var Rect = rectCreator.createObject(row, {x: timerRect.xRow, countText: timerRect.count + 1, colorChange: "transparent"});
//                }





            print(timerRect.count)
        }
    }

    ScrollView {
        id: scroll
        height: 40
        width: window.width
        contentWidth: timerRect.xRow
        contentHeight: row.height
        ScrollBar.horizontal.position: timerRect.count + 1



        //ScrollBar.horizontal.interactive: false
        //ScrollBar.horizontal.pressed: false
        //        ScrollBar.interactive: false
        //        enabled: false
        Row{
            id: row
            spacing: 2

//            Repeater{
//                id: repeat
//                //                model: timerRect.count
//                Rectangle{
//                    id: rect
//                    width: 40
//                    height: 40

//                    color: "green"

//                    Text {
//                        text: index+1
//                    }
//                }
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
                timerRect.stop()




                startWindow.show()
                window.hide()

                //                var placeMent

                //                var rectCreator = Qt.createComponent("RectGreen.qml")
                //                var Rect = rectCreator.createObject(parent, {x: mouseX, y: mouseY});
            }
        }
    }

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
            sizeRectangleCurrent = window.width / slider.value

            window.changedWidthSignal(sizeRectangleCurrent, timerRect.xRow)

            //scroll.contentWidth = timerRect.count * sizeRectangleCurrent
        }

        Component.onCompleted: {
            sizeRectangleCurrent = window.width / slider.value


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

