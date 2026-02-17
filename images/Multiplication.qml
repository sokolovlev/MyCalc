// Generated from SVG file nef/multiplication.svg
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
            PathSvg { path: "M 21.7175 8.2825 L 8.2825 21.7175 " }
        }
        ShapePath {
            id: _qt_shapePath_1
            strokeColor: "#ffffffff"
            strokeWidth: 2
            capStyle: ShapePath.RoundCap
            joinStyle: ShapePath.RoundJoin
            miterLimit: 4
            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            PathSvg { path: "M 21.7175 21.7175 L 8.2825 8.2825 " }
        }
    }
}
