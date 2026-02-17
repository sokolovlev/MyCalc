import QtQuick
import QtQuick.Controls

import "qrc:/symbols"
import "qrc:/operators"
import "qrc:/main"

Item
{
    id: screen1

    Rectangle
    {
        color: "#024873"
        anchors.fill: parent

        Rectangle
        {
            id: topBar
            height: parent.height * 0.0375                     //0.278
            color: "#04BFAD"

            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
        }

        Item
        {
            anchors.top: topBar.bottom
            anchors.bottom: parent.bottom

            anchors.left: parent.left
            anchors.right: parent.right

            CalculationBack {}
            KeyBoard {}
        }
    }
}