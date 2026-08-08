import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
//import QString

import qs.config as Config

PanelWindow {
    id: panel
    visible: false
    IpcHandler {
        target: "settings"
        function toggle(): void {
            // Currently set to super alt d
            console.log("hi");
            panel.visible = !panel.visible;
        }
    }
    width: 1000
    height: 800
    Text {
        id: topText
        text: "Settings"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: Config.Theme.fontSize
    }
    ScrollView {
        height: parent.height - topText.height
        width: parent.width
        anchors.top: topText.bottom
        Flickable {
            width: parent.width
            height: parent.height
            contentWidth: column.width
            contentHeight: column.height
            ColumnLayout {
                id: column
                RowLayout {

                    Text {
                        text: "Splash"
                    }
                    ComboBox {
                        id: splashOptions

                        Process {
                            id: getValue
                            running: false
                            command: ["sh", "-c", "awk '/^splash/{print $NF}' ~/.config/hypr/hyprpaper.conf"]
                            stdout: StdioCollector {
                                onStreamFinished: {
                                    getValue.handleOutput(this.text.trim());
                                }
                            }
                            function handleOutput(text) {
                                console.log(text + " iis current");
                                var currentValue = text.charAt(0).toUpperCase() + text.slice(1);
                                console.log(currentValue + " is new whatever");
                                var newValueNum = splashOptions.find(currentValue);
                                console.log("new value is " + newValueNum);
                                var newValue = splashOptions.currentText;
                                console.log("idk this is " + newValue);
                                newValue = newValue.toLowerCase();
                                temp.newCommand = "sed -i 's/^\\(splash =\\).*/\\1 " + newValue + "/' ~/.config/hypr/hyprpaper.conf" + "";
                                console.log(temp.newCommand);
                                temp.running = true;
                            }
                        }
                        Process {
                            id: temp
                            property var newCommand
                            command: ["sh", "-c", newCommand]
                            stderr: StdioCollector {
                                onStreamFinished: console.log(this.text)
                            }
                            stdout: StdioCollector {
                                onStreamFinished: {
                                    console.log(this.text);
                                }
                            }
                        }
                        //property var idk: getCurrentIndex()
                        model: ["True", "False"]
                        //onCurrentIndexChanged: getCurrentIndex()//console.log(idk)
                        onActivated: getCurrentIndex()
                        //Remane this because its confusing
                        function getCurrentIndex() {
                            getValue.running = true;
                            //await getValue.running == false

                            //return currentValue
                        }
                    }
                }

                /*Repeater {
                    model: 50
                    Text {
                        text: index

                    }
                }*/
            }
        }
    }
}
