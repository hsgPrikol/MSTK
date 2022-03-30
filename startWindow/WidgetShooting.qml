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

    property real currentScaleTime: 30

    signal onChangeTarget(var target)

    signal onChangeScaleTime(var target)

    property var currentTargetActiv: -1

    property var rectGreenCreator

    onCurrentScaleTimeChanged: {
        onChangeScaleTime(currentScaleTime)
    }

    function createNewRectGreen(target, textInRect)
    {
        var Rect = rectGreenCreator.createObject(row,
                                        {
                                            x: window.xRow,
                                            textInRect: textInRect,
                                            currentScaleTime: currentScaleTime,
                                            attribute: target,
                                            timeCreated: mainClass.getDurationTrainingMSec(),
                                            widthParent: scroll.width,
                                            visible: ((target == currentTargetActiv) || (target == -1)) ? true : false
                                        });

        onChangeScaleTime.connect(Rect.changeScaleTime)
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
        if(zone == -1)
        {
            //рисуем новый квадрат
            //текст внутри квадрата это номер таргета
            //не указывать принадлежность квадрата к мишени

            createNewRectGreen(-1, target + 1)
        }
        else
        {
            //рисуем новый квадрат
            //текст внутри зона попадания
            //указывать принадлежность квадрата к мишени

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
        window.xRow  = ((scroll.width / currentScaleTime) / (1000 / mainClass.getTIMER_INTERVAL())) * (mainClass.getDurationTrainingMSec() / mainClass.getTIMER_INTERVAL())
    }

    property real xRow: 0.0

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
            height: 40
            width: 1030
            color: "transparent"

            ScrollView {
                id: scroll
                anchors.fill: parent
                height: 40
                wheelEnabled: false
                hoverEnabled: true
                width: parent.width
                contentWidth: window.xRow
                contentHeight: row.height
                ScrollBar.horizontal.position: window.xRow
                clip: true

                Flickable {
                    interactive: false
                }

                Row{
                    id: row

                    Rectangle {
                        color: "white"
                        x: window.xRow
                        height: 40
                        width: 1
                        radius: 1

                        onXChanged: {
                            if (x >= scroll.width - 5)
                            {
                                visible = false
                            }
                            else
                            {
                                visible = true
                            }
                        }
                    }
                }
            }
        }
    }
}
