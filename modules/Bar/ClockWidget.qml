import QtQuick

import "../../services" as Services
import "../../config" as Config

Text {
    text: Services.Time.time
    color: Config.Theme.colFg
    font.pixelSize: Config.Theme.fontSize
    font.family: Config.Theme.fontFamily
}