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

import QtQml
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts
import Fluid as Fluid
import Fluid.Private as P
import Fluid.Templates as FluidTemplates

FluidTemplates.DatePicker {
    id: picker

    /*!
        \internal
    */
    readonly property bool __isLandscape : picker.orientation === FluidTemplates.DatePicker.Landscape

    /*!
        \internal
    */
    readonly property bool __footerIsVisible: footer && footer.children.length > 0

    implicitWidth: background.implicitWidth
    implicitHeight: background.implicitHeight

    background: Pane {
        implicitWidth: __isLandscape ? 500 : 340
        implicitHeight: __isLandscape ? 350 : 470

        locale: picker.locale

        Material.elevation: __footerIsVisible ? 0 : 1
    }

    header: Rectangle {
        color: picker.Material.theme === Material.Dark ? picker.Material.dialogColor : picker.Material.accent

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 16
            spacing: 0

            Fluid.BodyLabel {
                text: yearSelector.selectedYear
                level: 2
                color: "white"
                opacity: yearSelector.visible ? 1 : 0.7
                font.pixelSize: 16

                MouseArea {
                    anchors.fill: parent
                    onClicked: picker.mode = FluidTemplates.DatePicker.Year
                }
            }

            Label {
                Layout.fillWidth: true
                Layout.fillHeight: true
                text: dateSelector.selectedDate.toLocaleString(picker.locale, "ddd, MMM dd")
                font.pixelSize: 30
                color: "white"
                wrapMode: Text.Wrap
                opacity: dateSelector.visible ? 1 : 0.7

                MouseArea {
                    anchors.fill: parent
                    onClicked: picker.mode = FluidTemplates.DatePicker.Month
                }
            }
        }
    }

    selector: Item {
        P.DateSelector {
            id: dateSelector
            width: parent.width
            height: parent.height
            dayOfWeekRowVisible: picker.dayOfWeekRowVisible
            weekNumberVisible: picker.weekNumberVisible
            from: picker.from
            to: picker.to
            locale: picker.locale
            visible: picker.mode === FluidTemplates.DatePicker.Month
            onSelectedDateChanged: {
                if (picker.selectedDate !== selectedDate) {
                    var date = new Date(picker.selectedDate.getTime());
                    date.setDate(selectedDate.getDate());
                    date.setMonth(selectedDate.getMonth());
                    date.setFullYear(selectedDate.getFullYear());
                    picker.selectedDate = new Date(date.getTime());
                    yearSelector.selectedYear = selectedDate.getFullYear();
                }
            }

            Binding {
                target   : dateSelector
                property : "selectedDate"
                value    : picker.selectedDate
            }
        }

        P.YearSelector {
            id: yearSelector
            width: parent.width
            height: parent.height
            from: picker.from
            to: picker.to
            visible: picker.mode === FluidTemplates.DatePicker.Year
            onSelectedYearChanged: {
                if (picker.selectedDate.getFullYear() !== selectedYear) {
                    var date = new Date(picker.selectedDate.getTime());
                    date.setFullYear(selectedYear);
                    picker.selectedDate = new Date(date.getTime());
                    dateSelector.selectedDate = new Date(date.getTime());
                }
            }
        }
    }
}
