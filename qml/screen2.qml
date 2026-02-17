import QtQuick
import QtQuick.Controls

Item
{
    id: screen2
    property bool isClicked: false

    Rectangle
    {
        color: "#024873"
        anchors.fill: parent

        Text
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: Math.round(parent.height * 0.2)

            font.pixelSize: Math.round(parent.height * 0.05)
            color: "#FFFFFF"
            font.family: "OpenSansSemibold"
            text: "Секретное меню"
        }

        Rectangle
        {
            width: parent.width / 3
            height: width / 2

            radius: Math.round(height / 4)
            anchors.centerIn:parent

            color: isClicked? "#F7E425" : "#F9AFAF"

            Text
            {
                anchors.centerIn: parent
                font.pixelSize: Math.round(parent.height * 0.5)
                color: "#FFFFFF"
                font.family: "OpenSansSemibold"
                text: "Назад"
            }

            MouseArea
            {
                anchors.fill: parent
                onClicked:{stackView.pop()}
            }
        }
    }
}