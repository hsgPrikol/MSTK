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

    signal onChangeTarget(var attribute)

    property var currentTargetActiv: -1

    function testSignal(attribute)
    {
        console.log("qwwwwwwwwwwwwwww ", attribute)
    }

    function startTimer()
    {
        timerRect.start()
    }

    function stopTimer()
    {
        timerRect.stop()
    }

    function setNameWidget(name)
    {
        nameWidget.text = name
    }

    function getNameWidget(name)
    {
        return nameWidget.text
    }

    Timer {
        id: timerRect
        property int count: -1
        property int xRow: 0
        interval: 500
        running: false
        repeat: true

        onTriggered: {
            var rectCreator = Qt.createComponent("RectGreen.qml")

            timerRect.count = timerRect.count + 1

            timerRect.xRow = (sizeRectangleCurrent * timerRect.count);
            var Rect
            //if (timerRect.count % 9)
            //{
//                Rect = rectCreator.createObject(row,
//                                                    {
//                                                        x: timerRect.xRow,
//                                                        countText: timerRect.count,
//                                                        colorChange: "transparent",
//                                                        dfltWidth: sizeRectangleCurrent,
//                                                        attribute: getRandom(1,3)
//                                                    });
            //}
            //else{

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


            //}

            onChangeTarget.connect(Rect.changeActivTarget)

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
                contentWidth: timerRect.xRow
                contentHeight: row.height
                ScrollBar.horizontal.position: timerRect.count + 1
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
