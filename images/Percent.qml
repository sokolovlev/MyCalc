// Generated from SVG file nef/percent.svg
import QtQuick
import QtQuick.VectorImage
import QtQuick.VectorImage.Helpers
import QtQuick.Shapes

Item {
    implicitWidth: 30
    implicitHeight: 30
    component AnimationsInfo : QtObject
    {
        property bool paused: false
        property int loops: 1
        signal restart()
    }
    property AnimationsInfo animations : AnimationsInfo {}
    transform: [
        Scale { xScale: width / 30; yScale: height / 30 }
    ]
    id: __qt_toplevel
    Shape {
        id: _qt_node0
        ShapePath {
            id: _qt_shapePath_0
            strokeColor: "#ffffffff"
            strokeWidth: 2
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin
            miterLimit: 4
            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 20 7 L 10 23 " }
        }
        ShapePath {
            id: _qt_shapePath_1
            strokeColor: "#ffffffff"
            strokeWidth: 2
            capStyle: ShapePath.FlatCap
            joinStyle: ShapePath.MiterJoin
            miterLimit: 4
            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 24 20 C 24 22.2091 22.6569 24 21 24 C 19.3431 24 18 22.2091 18 20 C 18 17.7909 19.3431 16 21 16 C 22.6569 16 24 17.7909 24 20 " }
        }
        ShapePath {
            id: _qt_shapePath_2
            strokeColor: "#ffffffff"
            strokeWidth: 2
            capStyle: ShapePath.FlatCap
            joinStyle: ShapePath.MiterJoin
            miterLimit: 4
            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 12 10 C 12 12.2091 10.6569 14 9 14 C 7.34315 14 6 12.2091 6 10 C 6 7.79086 7.34315 6 9 6 C 10.6569 6 12 7.79086 12 10 " }
        }
    }
}
