import QtQuick
import MyCalc 1.0

Rectangle
{
    id: sixPlate
    property bool isClicked: false
    property var scaleFactor: 0.2632
    property var fontSize: 0.4

    width: Math.round(parent.width * scaleFactor)
    height: width

    color: isClicked? "#F7E425" : "#B0D1D8"
    radius: width / 2

    Text
    {
        anchors.centerIn: parent
        color: "#024873"

        font.family: "OpenSansSemibold"
        font.pixelSize: parent.width * fontSize
        font.weight: 550
        text: "6"
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - sixPlate.radius
                var cY = mouse.y - sixPlate.radius

                if (cX * cX + cY * cY <= sixPlate.radius * sixPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false
            DataString.dataString += "6"
            Last3sym.last3("6")
        }
    }
}