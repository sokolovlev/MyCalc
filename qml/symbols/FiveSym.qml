import QtQuick
import MyCalc 1.0

Rectangle
{
    id: fivePlate
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

        font.family: OpenSansSemibold
        font.pixelSize: parent.width * fontSize
        font.weight: 600
        text: "5"
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - fivePlate.radius
                var cY = mouse.y - fivePlate.radius

                if (cX * cX + cY * cY <= fivePlate.radius * fivePlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false
            DataString.dataString += "5"
            Last3sym.last3("5")
        }
    }
}