pragma Singleton
import QtQuick

QtObject {
    readonly property int height: 30

    readonly property QtObject workspaces: QtObject {
        readonly property int shown: 10
    }
}