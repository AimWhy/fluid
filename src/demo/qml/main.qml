/*
 * This file is part of Fluid.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2018 Michael Spencer <sonrisesoftware@gmail.com>
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
import QtQuick.Controls.Material
import QtQuick.Layouts
import Fluid as Fluid

Fluid.ApplicationWindow {
    id: window

    visible: true

    width: 1024
    height: 800

    title: qsTr("Fluid Demo")

    appBar.maxActionCount: 3

    Material.primary: Material.LightBlue
    Material.accent: Material.Blue

    Fluid.NavigationDrawer {
        id: navDrawer

        readonly property bool mobileAspect: window.width < 500

        modal: mobileAspect
        interactive: mobileAspect
        position: mobileAspect ? 0.0 : 1.0
        visible: !mobileAspect

        topContent: Image {
            source: navDrawer.mobileAspect ? "qrc:/images/materialbg.png" : ""
            width: parent.width
            height: navDrawer.mobileAspect ? 200 : 0
        }

        Fluid.ScrollView {
            anchors.fill: parent

            clip: true

            ListView {
                id: navListView
                model: ListModel {
                    ListElement { category: qsTr("Basic"); title: qsTr("Button"); source: "qrc:/qml/Pages/Basic/ButtonPage.qml" }
                    ListElement { category: qsTr("Basic"); title: qsTr("CheckBox"); source: "qrc:/qml/Pages/Basic/CheckBoxPage.qml" }
                    ListElement { category: qsTr("Basic"); title: qsTr("RadioButton"); source: "qrc:/qml/Pages/Basic/RadioButtonPage.qml" }
                    ListElement { category: qsTr("Basic"); title: qsTr("Switch"); source: "qrc:/qml/Pages/Basic/SwitchPage.qml" }
                    ListElement { category: qsTr("Basic"); title: qsTr("ProgressBar"); source: "qrc:/qml/Pages/Basic/ProgressBarPage.qml" }
                    ListElement { category: qsTr("Basic"); title: qsTr("BusyIndicator"); source: "qrc:/qml/Pages/Basic/BusyIndicatorPage.qml" }
                    ListElement { category: qsTr("Basic"); title: qsTr("Slider"); source: "qrc:/qml/Pages/Basic/SliderPage.qml" }
                    ListElement { category: qsTr("Layout"); title: qsTr("AutomaticGrid"); source: "qrc:/qml/Pages/Layouts/AutomaticGridPage.qml" }
                    ListElement { category: qsTr("Layout"); title: qsTr("ColumnFlow"); source: "qrc:/qml/Pages/Layouts/ColumnFlowPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("BottomSheet"); source: "qrc:/qml/Pages/Controls/BottomSheetPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Card"); source: "qrc:/qml/Pages/Controls/CardPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Chip"); source: "qrc:/qml/Pages/Controls/ChipPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Dialogs"); source: "qrc:/qml/Pages/Controls/DialogsPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("DatePicker"); source: "qrc:/qml/Pages/Controls/DatePickerPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("DateTimePicker"); source: "qrc:/qml/Pages/Controls/DateTimePickerPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("FAB"); source: "qrc:/qml/Pages/Controls/ActionButtonPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("ListItem"); source: "qrc:/qml/Pages/Controls/ListItemPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("NavigationDrawer"); source: "qrc:/qml/Pages/Controls/NavDrawerPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("NavigationListView"); source: "qrc:/qml/Pages/Controls/NavigationListViewPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Overlay"); source: "qrc:/qml/Pages/Controls/OverlayPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Placeholder"); source: "qrc:/qml/Pages/Controls/PlaceholderPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Search"); source: "qrc:/qml/Pages/Controls/SearchPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("SnackBar"); source: "qrc:/qml/Pages/Controls/SnackBarPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("TimePicker"); source: "qrc:/qml/Pages/Controls/TimePickerPage.qml" }
                    ListElement { category: qsTr("Controls"); title: qsTr("Wave"); source: "qrc:/qml/Pages/Controls/WavePage.qml" }
                    ListElement { category: qsTr("Style"); title: qsTr("Palette"); source: "qrc:/qml/Pages/Style/PalettePage.qml" }
                    ListElement { category: qsTr("Style"); title: qsTr("Typography"); source: "qrc:/qml/Pages/Style/TypographyPage.qml" }
                    ListElement { category: qsTr("Style"); title: qsTr("System Icons"); source: "qrc:/qml/Pages/Style/SystemIconsPage.qml" }
                    ListElement { category: qsTr("Style"); title: qsTr("Material Icons"); source: "qrc:/qml/Pages/Style/IconsPage.qml" }
                }
                currentIndex: -1
                section.property: "category"
                section.criteria: ViewSection.FullString
                section.delegate: Fluid.Subheader {
                    text: section
                    width: parent.width

                    Fluid.ThinDivider {
                        width: parent.width
                    }
                }
                delegate: Fluid.ListItem {
                    text: model.title
                    highlighted: ListView.isCurrentItem
                    onClicked: {
                        navListView.currentIndex = index;
                        stackView.push(model.source);
                        if (navDrawer.modal)
                            navDrawer.close();
                    }
                }
            }
        }
    }

    initialPage: Fluid.Page {
        title: window.title

        x: navDrawer.modal ? 0 : navDrawer.position * navDrawer.width
        width: window.width - x

        leftAction: Fluid.Action {
            icon.source: Fluid.Utils.iconUrl("navigation/menu")
            visible: navDrawer.modal
            onTriggered: navDrawer.visible ? navDrawer.close() : navDrawer.open()
        }

        actions: [
            Fluid.Action {
                text: qsTr("Dummy error")
                icon.source: Fluid.Utils.iconUrl("alert/warning")
                toolTip: qsTr("Show a dummy error")
                onTriggered: console.log("Dummy error")
            },
            Fluid.Action {
                text: qsTr("Colors")
                icon.source: Fluid.Utils.iconUrl("image/color_lens")
                toolTip: qsTr("Pick a color")
                onTriggered: console.log("Colors")
            },
            Fluid.Action {
                text: qsTr("Settings")
                icon.source: Fluid.Utils.iconUrl("action/settings")
                toolTip: qsTr("Settings")
                hoverAnimation: true
                onTriggered: console.log("Settings clicked")
            },
            Fluid.Action {
                text: qsTr("This should not be visible")
                icon.source: Fluid.Utils.iconUrl("alert/warning")
                visible: false
            },
            Fluid.Action {
                text: qsTr("Language")
                icon.source: Fluid.Utils.iconUrl("action/language")
                enabled: false
            },
            Fluid.Action {
                text: qsTr("Accounts")
                icon.source: Fluid.Utils.iconUrl("action/account_circle")
            }
        ]

        Fluid.StackView {
            id: stackView
            anchors.fill: parent
            initialItem: Fluid.Placeholder {
                icon.source: Fluid.Utils.iconUrl("content/filter_list")
                text: qsTr("Select a demo")
                subText: qsTr("At the moment there is no demo selected from the navigration drawer, choose one and play with it.")
            }
        }
    }
}
