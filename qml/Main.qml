import QtQuick
import QtQuick.Controls

import "qrc:/symbols"
import "qrc:/operators"

ApplicationWindow
{
    width: 360
    height: 640
    visible: true

    StackView
    {
        id: stackView
        anchors.fill: parent
        initialItem: "qrc:/main/screen1.qml"
    }

    Connections
    {
        target: SecretSignal
        onSecretTriggered: {stackView.push("qrc:/main/screen2.qml")}
    }
}