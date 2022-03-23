import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Item {
    id: rectGreen
    property var countText: 1
    property var colorChange: Qt.rgba(Math.random(),Math.random(),Math.random(), 0.5)

    function setText()
    {
        print("12312312")
    }

    property var dfltWidth: 40
    property var dfltHeight: 40

    property var attribute: -1

//    property var dfltX: 42

    Rectangle{

        id: test
        width: dfltWidth
        height: dfltHeight
        color: colorChange

//        x: dfltX
//        y: mouse.y

        Text {
            text: countText
        }

        Text {
            anchors.horizontalCenter: test.horizontalCenter
            anchors.verticalCenter: test.verticalCenter
            text: attribute
        }

        MouseArea{
            id: mouse
            anchors.fill: parent

            onClicked: {
                test.color = test.color == "#008000" ? "red" : "#008000"
                print(test.color)
            }
        }
    }

    function changeActivTarget(newActivTaret)
    {
        rectGreen.visible = newActivTaret != attribute ? false : true

        console.log("function changeActivTarget(newActivTaret)")
    }

    function setWidthRectGreen(newWidth, newXPosition)
    {
        test.width = newWidth
        rectGreen.x = (newWidth * countText);

//        rectGreen.x = newXPosition
        //rectGreen.dfltWidth = newWidth
    }
}
