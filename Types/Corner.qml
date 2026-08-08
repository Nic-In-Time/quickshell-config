import Quickshell
import QtQuick
import QtQuick.Shapes

Rectangle {
    id: root
    // widthVar: the width of the shape.
    // heightVar: the height of the shape.
    // control vars: where the curve "pulls" towards.
    required property var widthVar
    required property var heightVar
    required property var controlXvar
    required property var controlYvar

    height: heightVar
    width: widthVar
    color: "transparent"
    Shape {
        id: shape
        width: parent.width
        height: parent.height
        ShapePath {
            fillColor: "white"
            startX: shape.getStartXPos()
            startY: 0
            PathQuad {
                x: shape.getEndXPos()
                y: root.height
                controlX: controlXvar
                controlY: controlYvar
            }

            PathLine {
                x: controlXvar > root.width / 2 ? root.width : 0
                y: controlYvar > root.height / 2 ? root.height : 0
            }

            PathLine {
                x: controlXvar > root.width / 2 ? root.width : 0
                y: controlYvar > root.height / 2 ? root.height : 0
            }
        }

        function getStartXPos() {
            if (controlXvar > root.width / 2) {
                if (controlYvar > root.height / 2) {
                    return root.width;
                } else {
                    return 0;
                }
            } else {
                if (controlYvar > root.height / 2) {
                    return 0;
                } else {
                    return root.width;
                }
            }
        }
        function getEndXPos() {
            if (controlXvar > root.width / 2) {
                if (controlYvar > root.height / 2) {
                    return 0;
                } else {
                    return root.width;
                }
            } else {
                if (controlYvar > root.height / 2) {
                    return root.width;
                } else {
                    return 0;
                }
            }
        }
    }
}
