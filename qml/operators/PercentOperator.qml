import QtQuick
import "qrc:/images"
import MyCalc 1.0

Rectangle
{
    id: percentOperatorPlate
    property bool isClicked: false

    width: Math.round(parent.width * 0.1923)
    height: width

    color: isClicked? "#F7E425" : "#0889A6"
    radius: width / 2

    Percent
    {
        anchors.centerIn: parent
        width: parent.width * 0.5
        height: width
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - percentOperatorPlate.radius
                var cY = mouse.y - percentOperatorPlate.radius

                if (cX * cX + cY * cY <= percentOperatorPlate.radius * percentOperatorPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false

            const operators = ["+", "-", "*", "/", "%","."]
            const numbers = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9",]

            if (DataString.dataString.length != 0)
            {
                let lastChar = DataString.dataString[DataString.dataString.length - 1]
                let preLastChar = DataString.dataString[DataString.dataString.length - 2]

                if (operators.includes(lastChar) && numbers.includes(preLastChar))
                {
                    DataString.dataString = DataString.dataString.slice(0, -1) + "%"
                    Last3sym.last3("%")
                }

                else if (lastChar == ")")
                {
                    DataString.dataString += "%"
                    Last3sym.last3("%")
                }

                else if (lastChar == "(")
                {
                    DataString.dataString += ""
                    Last3sym.last3("")
                }

                else
                {
                    DataString.dataString += "%"
                    Last3sym.last3("%")
                }
            }
        }
    }
}