import QtQuick

import "../../services" as Services
import "../../config" as Config

Text {
    text: Services.Battery.batteryInfo
    color: Services.Battery.percentage > 0.10 ? Config.Theme.colFg : "red"
    font.pixelSize: Config.Theme.fontSize
    font.family: Config.Theme.fontFamily
}