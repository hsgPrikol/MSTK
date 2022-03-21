//import QtQuick 2.15
//import QtQuick.Window 2.15
//import QtQuick.Controls 2.15

//Item {
//    id: rectGreen
//    property var countText: 1
//    property var colorChange: Qt.rgba(Math.random(),Math.random(),Math.random())

//    property int  widthGreen: 22
//    property int  heightGreen: 40

//    function setText()
//    {
//        print("12312312")
//    }

//    Rectangle{

//        id: test
//        width: widthGreen
//        height: heightGreen
//        color: colorChange
////        border.width: 2

////        x: mouse.x
////        y: mouse.y

//        Text {
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.verticalCenter: parent.verticalCenter
//            text: countText
//        }

//        MouseArea{
//            id: mouse
//            anchors.fill: parent

//            onClicked: {
//                test.color = test.color == "#008000" ? "red" : "#008000"
//                print(test.color)
//            }
//        }
//    }
//}

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

        MouseArea{
            id: mouse
            anchors.fill: parent

            onClicked: {
                test.color = test.color == "#008000" ? "red" : "#008000"
                print(test.color)
            }
        }
    }

    function setWidthRectGreen(newWidth, newXPosition)
    {
        test.width = newWidth
        rectGreen.x = ((newWidth  + 5) * countText);

//        rectGreen.x = newXPosition
        //rectGreen.dfltWidth = newWidth
    }
}
