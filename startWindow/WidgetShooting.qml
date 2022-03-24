import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls.Styles 1.4
import QtQuick.Dialogs 1.3

Rectangle {
    id: window
    width: 1180
    height: 40
    border.width: 1
    border.color: "white"

    color: "transparent"

    Component.onCompleted: {
        mainClass.onCalcXRow.connect(calcXRow)
        mainClass.setIsCalcXRow(true)

        rectGreenCreator = Qt.createComponent("RectGreen.qml")
    }

    signal onChangeTarget(var target)

    property var currentTargetActiv: -1

    property var rectGreenCreator

    function createNewRectGreen(target, textInRect)
    {
        var Rect = rectGreenCreator.createObject(row,
                                        {
                                            x: window.xRow,
                                            countText: textInRect,
                                            colorChange: "#92da18",
                                            dfltWidth: sizeRectangleCurrent,
                                            attribute: target,
                                            visible: ((target == currentTargetActiv) || (target == -1)) ? true : false
                                        });

        onChangeTarget.connect(Rect.changeActivTarget)
    }

    function decryptionZone(zone)
    {
        switch (zone)
        {

        case 0:
            return "Ц"

        case 1:
            return "Ф"

        case 2:
            return "ФЛ"

        case 3:
            return "ФП"

        case 4:
            return "ЛБ"

        case 5:
            return "ПБ"

        case 6:
            return "СЛФ"

        case 7:
            return "СЛТ"

        case 8:
            return "СПФ"

        case 9:
            return "СПТ"

        case 10:
            return "Т"

        case 11:
            return "ТЛ"

        case 12:
            return "ТП"

        }
    }

    function handlerNewHit(target, zone)
    {
        console.log("~~~~2~~~")

        if(zone == -1)
        {
            //рисуем новый квадрат
            //текст внутри квадрата это номер таргета
            //не указывать принадлежность квадрата к мишени

            console.log("~~~~3~~~")
            createNewRectGreen(-1, target)
        }
        else
        {
            //рисуем новый квадрат
            //текст внутри зона попадания
            //указывать принадлежность квадрата к мишени

            console.log("~~~~4~~~")
            createNewRectGreen(target, decryptionZone(zone))
        }
    }

    function setNameWidget(name)
    {
        nameWidget.text = name
    }

    function getNameWidget(name)
    {
        return nameWidget.text
    }

    // смещение по скролл вию
    function calcXRow()
    {
        window.count += 1

        window.xRow = (sizeRectangleCurrent * window.count);
    }

    property int count: -1
    property int xRow: 0

//    Timer {
//        id: timerRect
//        interval: 500
//        running: false
//        repeat: true

////        onTriggered: {
////            var rectCreator = Qt.createComponent("RectGreen.qml")

////            timerRect.count = timerRect.count + 1

////            timerRect.xRow = (sizeRectangleCurrent * timerRect.count);
////            var Rect

////            var tmpRmdTrgt = mainClass.getRandom(1,3)

////            Rect = rectCreator.createObject(row,
////                                            {
////                                                x: timerRect.xRow,
////                                                countText: timerRect.count,
////                                                colorChange: "#92da18",
////                                                dfltWidth: sizeRectangleCurrent,
////                                                attribute: tmpRmdTrgt,
////                                                visible: tmpRmdTrgt == currentTargetActiv ? true : false
////                                            });


////            //}

////            onChangeTarget.connect(Rect.changeActivTarget)

////            //            onChangeTarget.connect(Rect.changeActivTarget)
////            //            changedWidthSignal.connect(Rect.setWidthRectGreen)

////            //            changedWidthSignal.connect(Rect.setWidthRectGreen)
////            //            print(timerRect.count)
////        }

////        //        Component.onCompleted: {
////        //            onChangeTarget.connect(window.testSignal)
////        //            console.log("onChangeTarget.connect(window.testSignal)")
////        //        }
//    }

    Row {
        id: rowWidget
        anchors.fill: parent
        spacing: 3

        Rectangle {
            width: 150
            height: parent.height
            color: "#92da18"

            Text {
                id: nameWidget
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 22
                font.family: "Calibri"
                color: "#000000"
            }
        }

        Rectangle {
            id: windowRect
            x: 150
            //        y: 0
            height: 40
            width: 1030
            //anchors.horizontalCenter: parent.horizontalCenter
            color: "transparent"

            ScrollView {
                id: scroll
                anchors.fill: parent
                //                x: 150
                height: 40
                wheelEnabled: false
                hoverEnabled: true
                width: parent.width
                contentWidth: window.xRow
                contentHeight: row.height
                ScrollBar.horizontal.position: window.count + 1
                clip: true

                Flickable {
                    interactive: false
                }

                Row{
                    id: row
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}
}
##^##*/
