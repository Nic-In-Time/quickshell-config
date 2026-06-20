pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Services.UPower

Singleton {

    readonly property string batteryInfo: (UPower.onBattery ? "" : "󱐋") + (percentage > 0.90 ? " " : percentage > 0.75 ? " " : percentage > 0.50 ? " " : percentage > 0.25 ? " " : " ") + percentage * 100 + "%"

    readonly property real percentage: UPower.displayDevice?.percentage ?? 1
}

/*"format": "{icon} {capacity}%",
    "format-charging": "  {capacity}%",
    "format-plugged": "  {capacity}%",
    "format-alt": "{icon}  {time}",
    // "format-good": "", // An empty format will hide the module
    // "format-full": "",
    "format-icons": [
      " ",
      " ",
      " ",
      " ",
      " "
    ]*/
