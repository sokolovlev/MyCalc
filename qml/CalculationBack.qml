import QtQuick
import QtQuick.Controls
import MyCalc 1.0

Item
{
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: Math.round(width * 0.4333)

    Rectangle
    {
        anchors.fill: parent
        radius: Math.round(height * 0.1923)
        color: "#04BFAD"
    }

    Rectangle
    {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right

        height: parent.height / 2
        color: "#04BFAD"
    }

    Text
    {
        anchors.top: parent.top
        anchors.left: parent.left

        anchors.topMargin: Math.round(parent.height * 0.2821 )
        anchors.leftMargin: Math.round(parent.width * 0.1111)

        width: Math.round(parent.width * 0.7778)
        height: Math.round(parent.height * 0.1923)

        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter

        color: "#FFFFFF"
        font.family: OpenSansSemibold
        font.pixelSize: Math.round(parent.height * 0.1282)
        font.letterSpacing: Math.round(parent.height * 0.003205)
        font.weight: 600

        text: DataString.dataString
    }

    Text
    {
        anchors.top: parent.top
        anchors.left: parent.left

        anchors.topMargin: Math.round(parent.height * 0.5256 )
        anchors.leftMargin: Math.round(parent.width * 0.1111)

        width: Math.round(parent.width * 0.781)
        height: Math.round(parent.height * 0.3846)

        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter

        color: "#FFFFFF"
        font.family: OpenSansSemibold
        font.pixelSize: Math.round(parent.height * 0.326)
        font.letterSpacing: Math.round(parent.height * 0.003205)
        font.weight: 600

        text: Result.view()
    }
}