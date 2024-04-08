import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Fluid as Fluid

Fluid.ApplicationWindow {
    width: 640
    height: 480
    title: qsTr("Hello World")
    visible: true

    initialPage: Fluid.TabbedPage {
        title: qsTr("Tabbed Page")

        actions: [
            Fluid.Action {
                icon.source: Fluid.Utils.iconUrl("content/add")
                text: qsTr("Add content")
                toolTip: qsTr("Add content")
                onTriggered: console.log("Example action...")
            }
        ]

        Fluid.Tab {
            title: qsTr("First")

            Page1 {
                anchors.fill: parent
            }
        }

        Fluid.Tab {
            title: qsTr("Second")

            Label {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }
        }
    }
}
