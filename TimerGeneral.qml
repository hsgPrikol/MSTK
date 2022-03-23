import QtQuick 2.0

import "./startWindow"

Item {
    id: timerGeneral

    Timer {
        id: timerRect
        property int count: -1
        property int xRow: 0
        interval: 500
        running: true
        repeat: true

        onTriggered: {
            var rectCreator = Qt.createComponent("RectGreen.qml")

            timerRect.count = timerRect.count + 1

            timerRect.xRow = (sizeRectangleCurrent * timerRect.count);
            var Rect
            var tmpRmdTrgt = mainClass.getRandom(1,3)

            Rect = rectCreator.createObject(row,
                                            {
                                                x: timerRect.xRow,
                                                countText: timerRect.count,
                                                colorChange: "#92da18",
                                                dfltWidth: sizeRectangleCurrent,
                                                attribute: tmpRmdTrgt,
                                                visible: tmpRmdTrgt == currentTargetActiv ? true : false
                                            });



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
}
