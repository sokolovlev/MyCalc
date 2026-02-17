import QtQuick
import QtQuick.Controls

import "qrc:/operators"
import "qrc:/symbols"

Item
{
    id: keyBoard
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter

    anchors.topMargin: Math.round(parent.height * 0.2922)

    width: Math.round(screen1.width * 0.8667)
    height: Math.round(parent.height * 0.6429)

    NumPad{}

    BracketsSym
    {
        id: brackets
        anchors.top: keyBoard.top
        anchors.left: keyBoard.left
    }

    PlusMinusOperator
    {
        id: plusminus
        anchors.top: keyBoard.top
        anchors.left: brackets.right
        anchors.leftMargin: Math.round(keyBoard.width * 0.077)
    }

    PercentOperator
    {
        id: percent
        anchors.top: keyBoard.top
        anchors.left: plusminus.right
        anchors.leftMargin: Math.round(keyBoard.width * 0.077)
    }

    DivisionOperator
    {
        id: division
        anchors.top: keyBoard.top
        anchors.right: keyBoard.right
    }

    MultiplicationOperator
    {
        id: multiplication
        anchors.top: division.bottom
        anchors.right: keyBoard.right
        anchors.topMargin: keyBoard.width * 0.077
    }

    MinusOperator
    {
        id: minus
        anchors.top: multiplication.bottom
        anchors.right: keyBoard.right
        anchors.topMargin: keyBoard.width * 0.077
    }

    PlusOperator
    {
        id: plus
        anchors.top: minus.bottom
        anchors.right: keyBoard.right
        anchors.topMargin: keyBoard.width * 0.077
    }

    EqualOperator
    {
        id: equal
        anchors.bottom: keyBoard.bottom
        anchors.right: keyBoard.right
    }
}