import QtQuick
import MyCalc 1.0
import "qrc:/images"

Rectangle
{
    id: bracketsSym
    property bool isClicked: false
    property var scaleFactor: 0.1923

    width: Math.round(parent.width * scaleFactor)
    height: width

    color: isClicked? "#F7E425" : "#0889A6"
    radius: width / 2

    Brackets
    {
        anchors.centerIn: parent
        width: parent.width / 2
        height: width
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - bracketsSym.radius
                var cY = mouse.y - bracketsSym.radius

                if (cX * cX + cY * cY <= bracketsSym.radius * bracketsSym.radius)
                    isClicked = true
            }

        onReleased:
        {
            isClicked = false

            if (DataString.count == 0)
            {
                DataString.dataString += "("
                DataString.count++
                Last3sym.last3("(")
            }
            else
            {
                DataString.dataString += ")"
                DataString.count--
                Last3sym.last3(")")
            }
        }
    }
}