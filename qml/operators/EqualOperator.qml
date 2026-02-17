import QtQuick
import QtQuick.Controls
import "qrc:/images"
import MyCalc 1.0

Rectangle
{
    id: equalOperatorPlate

    property bool isClicked: false
    property bool secretMode: false
    property string inputSequence: ""

    width: Math.round(parent.width * 0.1923)
    height: width
    color: isClicked? "#F7E425" : "#0889A6"
    radius: width / 2

    Equal
    {
        anchors.centerIn: parent
        width: parent.width * 0.5
        height: width
    }

    Timer
    {
        id: holdTimer
        interval: 4000
        repeat: false
        onTriggered:
        {
            secretMode = true
            inputSequence = ""
            secretInputTimer.start()
        }
    }
    Timer
    {
        id: secretInputTimer
        interval: 5000
        repeat: false
        onTriggered: {secret()}
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: (mouse) =>
            {
                var cX = mouse.x - equalOperatorPlate.radius
                var cY = mouse.y - equalOperatorPlate.radius

                if (cX * cX + cY * cY <= equalOperatorPlate.radius * equalOperatorPlate.radius)
                {
                    isClicked = true
                    holdTimer.start()
                }

            }

        onReleased:
        {
            isClicked = false
            holdTimer.stop()
            let result = parser.evaluate(DataString.dataString)
            Result.add(result)
        }
    }
    function secret()
    {
        inputSequence = Last3sym.view()
        if (inputSequence === "123")
            SecretSignal.triggerSecret()
        secretMode = false
        inputSequence = ""
        secretInputTimer.stop()
    }
}

