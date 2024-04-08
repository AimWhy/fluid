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
import QtQuick.Controls
import QtQuick.Controls.Material
import Fluid as Fluid
import "../.." as Components

Components.StyledPage {
    id: page

    ScrollView {
        anchors.fill: parent
        clip: true

        Column {
            spacing: 16

            Button {
                text: qsTr("Landscape")
                onClicked: datePickerDialogLandscape.open()
            }

            Button {
                text: qsTr("Portrait")
                onClicked: datePickerDialogPortrait.open()
            }

            Fluid.DisplayLabel {
                id: dateLabel
                level: 2
                text: qsTr("n.a.")
            }

            Fluid.DatePicker {
                orientation: Fluid.DatePicker.Landscape
                selectedDate: new Date(2012, 11, 21)
                onSelectedDateChanged: console.log("Selected date:", selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd"))
            }

            Fluid.DatePicker {
                orientation: Fluid.DatePicker.Portrait
                selectedDate: new Date(2012, 11, 21)
                onSelectedDateChanged: console.log("Selected date:", selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd"))
            }
        }

        Fluid.DatePickerDialog {
            id: datePickerDialogLandscape
            orientation: Fluid.DatePicker.Landscape
            selectedDate: new Date(2012, 11, 21)
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            standardButtonsContainer: Button {
                height: parent.height - 5
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Today")
                flat: true
                onClicked: datePickerDialogLandscape.selectedDate = new Date()
            }
            onAccepted: dateLabel.text = selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd")
            onSelectedDateChanged: console.log("Selected date:", selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd"))

            Material.theme: page.Material.theme
        }

        Fluid.DatePickerDialog {
            id: datePickerDialogPortrait
            orientation: Fluid.DatePicker.Portrait
            selectedDate: new Date(2012, 11, 21)
            standardButtons: DialogButtonBox.Ok | DialogButtonBox.Cancel
            standardButtonsContainer: Button {
                height: parent.height - 5
                anchors.verticalCenter: parent.verticalCenter
                text: qsTr("Today")
                flat: true
                onClicked: datePickerDialogPortrait.selectedDate = new Date()
            }
            onAccepted: dateLabel.text = selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd")
            onSelectedDateChanged: console.log("Selected date:", selectedDate.toLocaleString(Qt.locale(), "yyyy-MM-dd"))

            Material.theme: page.Material.theme
        }
    }
}
