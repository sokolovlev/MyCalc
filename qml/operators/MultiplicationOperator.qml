import QtQuick
import "qrc:/images"
import MyCalc 1.0

Rectangle
{
    id: multiplicationOperatorPlate
    property bool isClicked: false

    width: Math.round(parent.width * 0.1923)
    height: width

    color: isClicked? "#F7E425" : "#0889A6"
    radius: width / 2

    Multiplication
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
                var cX = mouse.x - multiplicationOperatorPlate.radius
                var cY = mouse.y - multiplicationOperatorPlate.radius

                if (cX * cX + cY * cY <= multiplicationOperatorPlate.radius * multiplicationOperatorPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false

            const operators = ["+", "-", "*", "/", "%","."]

            if (DataString.dataString.length != 0)
            {
                let lastChar = DataString.dataString[DataString.dataString.length - 1]

                if (operators.includes(lastChar))
                {
                    DataString.dataString = DataString.dataString.slice(0, -1) + "*"
                    Last3sym.last3("*")
                }
                else
                {
                    DataString.dataString += "*"
                    Last3sym.last3("*")
                }
            }
        }
    }
}