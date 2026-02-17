import QtQuick
import MyCalc 1.0

Rectangle
{
    id: dotPlate
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
        text: "."
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - dotPlate.radius
                var cY = mouse.y - dotPlate.radius

                if (cX * cX + cY * cY <= dotPlate.radius * dotPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false
            let lastChar = DataString.dataString[DataString.dataString.length - 1]
            const numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

            if (numbers.includes(lastChar))
            {
                DataString.dataString += "."
                Last3sym.last3(".")
            }
        }
    }
}