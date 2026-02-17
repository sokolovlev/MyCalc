import QtQuick
import MyCalc 1.0

Rectangle
{
    id: cOperatorPlate
    property bool isClicked: false

    width: Math.round(parent.width * 0.2632)
    height: width

    color: isClicked? "#F7E425" : "#F9AEAE"
    radius: width / 2

    Text
    {
        anchors.centerIn: parent
        color: "#FFFFFF"

        font.family: "OpenSansSemibold"
        font.pixelSize: parent.width * 0.4
        font.weight: 550
        text: "C"
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - cOperatorPlate.radius
                var cY = mouse.y - cOperatorPlate.radius

                if (cX * cX + cY * cY <= cOperatorPlate.radius * cOperatorPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false
            DataString.dataString = ""
        }
    }
}