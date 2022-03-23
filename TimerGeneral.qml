import QtQuick 2.0

import "./startWindow"

//Item {
//    id: timerGeneral
//    property var textDate
//    property var textTime
//    property bool startTimer: false



    Timer {
        id: timerGeneral
        property int count: -1
        property int xRow: 0
        interval: 500
        running: true
        repeat: true

        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        signal timerGeneral_1SecSignal()

        property var timerGeneral_1SecVar: 1000 / timerRect.interval

        function timerGeneral_1Sec(){
            timerGeneral_1SecVar -= 1

            if (timerGeneral_1SecVar == 0)
            {
                timerGeneral.timerGeneral_1SecSignal()
                timerGeneral_1SecVar = 1000 / timerRect.interval
            }
        }
        //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        onTriggered: {
            timerGeneral_1Sec()
            console.log("timer")

            //timerGeneral_1Sec()
//            var rectCreator = Qt.createComponent("RectGreen.qml")

//            timerRect.count = timerRect.count + 1

//            timerRect.xRow = (sizeRectangleCurrent * timerRect.count);
//            var Rect
//            var tmpRmdTrgt = mainClass.getRandom(1,3)

//            Rect = rectCreator.createObject(row,
//                                            {
//                                                x: timerRect.xRow,
//                                                countText: timerRect.count,
//                                                colorChange: "#92da18",
//                                                dfltWidth: sizeRectangleCurrent,
//                                                attribute: tmpRmdTrgt,
//                                                visible: tmpRmdTrgt == currentTargetActiv ? true : false
//                                            });
            //timerGeneral.textDate = mainClass.getTime()

//            mainClass.getDate()

            //}

            //            onChangeTarget.connect(Rect.changeActivTarget)

            //            onChangeTarget.connect(Rect.changeActivTarget)
            //            changedWidthSignal.connect(Rect.setWidthRectGreen)

            //            changedWidthSignal.connect(Rect.setWidthRectGreen)
            //            print(timerRect.count)
        }

        //        Component.onCompleted: {
        //            onChangeTarget.connect(window.testSignal)
        //            console.log("onChangeTarget.connect(window.testSignal)")
        //        }
    }
//}
