import QtQuick
import QtQuick.Controls

import "qrc:/symbols"
import "qrc:/operators"

Item
{
    anchors.left: parent.left
    anchors.bottom: parent.bottom

    width: Math.round(parent.width * 0.731)
    height: Math.round(parent.height * 0.7879)

    Grid
    {
        anchors.fill: parent

        spacing: Math.round(width * 0.1053)

        columns: 3
        rows: 4

        SevenSym{}
        EightSym{}
        NineSym{}

        FourSym{}
        FiveSym{}
        SixSym{}

        OneSym{}
        TwoSym{}
        ThreeSym{}

        COperator{}
        ZeroSym{}
        DotSym{}
    }
}