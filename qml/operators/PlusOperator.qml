import QtQuick
import "qrc:/images"
import MyCalc 1.0

Rectangle
{
    id: plusOperatorPlate
    property bool isClicked: false

    width: Math.round(parent.width * 0.1923)
    height: width

    color: isClicked? "#F7E425" : "#0889A6"
    radius: width / 2

    Plus
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
                var cX = mouse.x - plusOperatorPlate.radius
                var cY = mouse.y - plusOperatorPlate.radius

                if (cX * cX + cY * cY <= plusOperatorPlate.radius * plusOperatorPlate.radius)
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
                    DataString.dataString = DataString.dataString.slice(0, -1) + "+"
                    Last3sym.last3("+")
                }
                else
                {
                    DataString.dataString += "+"
                    Last3sym.last3("+")
                }
            }
        }
    }
}