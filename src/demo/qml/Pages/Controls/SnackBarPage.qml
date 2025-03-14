/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

import QtQuick
import Fluid as Fluid

Item {
    Column {
        anchors.centerIn: parent

        Fluid.TextField {
            id: textField
            placeholderText: qsTr("Text")
            text: qsTr("Marked as read")
            width: 300
        }

        Fluid.TextField {
            id: buttonTextField
            placeholderText: qsTr("Button Text")
            text: qsTr("Undo")
            width: 300
        }

        Fluid.Switch {
            text: qsTr("Full Width")
            checked: snackBar.fullWidth
            onCheckedChanged: snackBar.fullWidth = checked
        }

        Row {
            spacing: 8

            Fluid.Button {
                text: qsTr("Open")
                onClicked: snackBar.open(textField.text, buttonTextField.text)
            }

            Fluid.Button {
                text: qsTr("Close")
                onClicked: snackBar.close()
            }
        }
    }

    Fluid.SnackBar {
        id: snackBar
        onClicked: console.log("Snack bar button clicked")
    }
}
