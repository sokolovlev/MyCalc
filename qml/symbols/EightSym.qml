import QtQuick
import MyCalc 1.0

Rectangle
{
    id: eightPlate
    property bool isClicked: false
    property var fontSize: 0.4

    width: Math.round(parent.width * 0.2632)
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
        text: "8"
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - eightPlate.radius
                var cY = mouse.y - eightPlate.radius

                if (cX * cX + cY * cY <= eightPlate.radius * eightPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false
            DataString.dataString += "8"
            Last3sym.last3("8")
        }
    }
}