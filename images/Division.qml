// Generated from SVG file nef/division.svg
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
            PathSvg { path: "M 24.5 15 L 5.5 15 " }
        }
        ShapePath {
            id: _qt_shapePath_1
            strokeColor: "transparent"
            fillColor: "#ffffffff"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 17 8 C 17 9.10457 16.1046 10 15 10 C 13.8954 10 13 9.10457 13 8 C 13 6.89543 13.8954 6 15 6 C 16.1046 6 17 6.89543 17 8 " }
        }
        ShapePath {
            id: _qt_shapePath_2
            strokeColor: "transparent"
            fillColor: "#ffffffff"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 17 22 C 17 23.1046 16.1046 24 15 24 C 13.8954 24 13 23.1046 13 22 C 13 20.8954 13.8954 20 15 20 C 16.1046 20 17 20.8954 17 22 " }
        }
    }
}
