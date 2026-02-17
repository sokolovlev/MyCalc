import QtQuick
import QtQuick.VectorImage
import "qrc:/images"
import MyCalc 1.0

Rectangle
{
    id: plusMinusOperatorPlate
    property bool isClicked: false

    width: Math.round(parent.width * 0.1923)
    height: width

    color: isClicked? "#F7E425" : "#0889A6"
    radius: width / 2

    /*VectorImage
    {
        anchors.centerIn: parent
        width: parent.width * 0.5
        height: width
        source: "qrc:/images/plusminus.svg"
    } */

    PlusMinus
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
                var cX = mouse.x - plusMinusOperatorPlate.radius
                var cY = mouse.y - plusMinusOperatorPlate.radius

                if (cX * cX + cY * cY <= plusMinusOperatorPlate.radius * plusMinusOperatorPlate.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false

            let lastPlus = DataString.dataString.lastIndexOf("+")
            let lastMinus = DataString.dataString.lastIndexOf("-")

            let lastOpIndex = Math.max(lastPlus, lastMinus)

            if (lastOpIndex != -1)
            {
                let lastOp = DataString.dataString[lastOpIndex]
                let newOp = lastOp === "+" ? "-" : "+"
                DataString.dataString = DataString.dataString.slice(0, lastOpIndex) + newOp + DataString.dataString.slice(lastOpIndex + 1)
                Last3sym.last3(newOp)
            }
        }
    }
}