import QtQuick

import qs.services as Services
import qs.config as Config

Text {
    text: Services.Time.time
    color: Config.Theme.colFg
    font.pixelSize: Config.Theme.fontSize
    font.family: Config.Theme.fontFamily
}
