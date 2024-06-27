/*
 * This file is part of 
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
import QtQuick.Controls.Material
import Fluid
import "../.." as Components

Components.StyledPage {
    Column {
        anchors.centerIn: parent
        spacing: 16

        Column {
            spacing: 16

            TitleLabel {
                text: qsTr("Input Chips")
            }

            ListModel {
                id: contactModel

                ListElement {
                    label: "Contact Name 1"
                    value: "primaryemail@email.com"
                    imageSource: "qrc:/images/balloon.jpg"
                }
                ListElement {
                    label: "Contact Name 2"
                    value: "email2@email.com"
                    imageSource: "qrc:/images/balloon.jpg"
                }
                ListElement {
                    label: "Contact Name 3"
                    value: "email3@email.com"
                    imageSource: "qrc:/images/balloon.jpg"
                }
            }

            Row {
                spacing: 8

                Chip {
                    id: inputChip1
                    iconItem: CircleImage {
                        source: inputChip1.selectedItem.imageSource
                        width: 24
                        height: 24
                    }
                    text: selectedItem.label
                    expandable: true
                    model: contactModel
                    onSelectedItemChanged: console.info(selectedItem.value)
                }

                Chip {
                    id: inputChip2
                    iconItem: CircleImage {
                        source: inputChip2.selectedItem.imageSource
                        width: 24
                        height: 24
                    }
                    text: selectedItem.label
                    expandable: true
                    deletable: true
                    model: contactModel
                    onDeleted: console.info(qsTr("Deleted"))
                    onSelectedItemChanged: console.info(selectedItem.value)
                }
            }
        }

        Column {
            spacing: 16

            TitleLabel {
                text: qsTr("Color Chips")
            }

            ButtonGroup {
                id: colorChipsGroup
            }

            Row {
                spacing: 8

                Chip {
                    id: colorChip1
                    iconItem: Rectangle {
                        width: 24
                        height: 24
                        radius: 12
                        color: Material.color(Material.Blue)

                        Icon {
                            anchors.centerIn: parent
                            source: colorChip1.checked ? Utils.iconUrl("navigation/check") : ""
                            size: 20
                        }
                    }
                    text: qsTr("Blue 500")
                    checkable: true
                    ButtonGroup.group: colorChipsGroup
                }

                Chip {
                    id: colorChip2
                    iconItem: Rectangle {
                        width: 24
                        height: 24
                        radius: 12
                        color: Material.color(Material.Green)

                        Icon {
                            anchors.centerIn: parent
                            source: colorChip2.checked ? Utils.iconUrl("navigation/check") : ""
                            size: 20
                        }
                    }
                    text: qsTr("Green 500")
                    checkable: true
                    ButtonGroup.group: colorChipsGroup
                }

                Chip {
                    id: colorChip3
                    iconItem: Rectangle {
                        width: 24
                        height: 24
                        radius: 12
                        color: Material.color(Material.Red)

                        Icon {
                            anchors.centerIn: parent
                            source: colorChip3.checked ? Utils.iconUrl("navigation/check") : ""
                            size: 20
                        }
                    }
                    text: qsTr("Red 500")
                    checkable: true
                    ButtonGroup.group: colorChipsGroup
                }
            }
        }

        Column {
            spacing: 16

            TitleLabel {
                text: qsTr("Choice Chips")
            }

            ButtonGroup {
                id: choiceChipsGroup
            }

            Row {
                id: choiceChips
                spacing: 8

                Chip {
                    checkable: true
                    checked: true
                    text: qsTr("Extra Soft")
                    ButtonGroup.group: choiceChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Soft")
                    ButtonGroup.group: choiceChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Medium")
                    ButtonGroup.group: choiceChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Hard")
                    ButtonGroup.group: choiceChipsGroup
                }
            }
        }

        Column {
            spacing: 16

            TitleLabel {
                text: qsTr("Filter Chips")
            }

            ButtonGroup {
                id: filterChipsGroup
                exclusive: false
            }

            Row {
                id: filterChips
                spacing: 8

                Chip {
                    checkable: true
                    checked: true
                    text: qsTr("Elevator")
                    icon.source: checked ? Utils.iconUrl("navigation/check") : ""
                    ButtonGroup.group: filterChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Washer / Dryer")
                    icon.source: checked ? Utils.iconUrl("navigation/check") : ""
                    ButtonGroup.group: filterChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Fireplace")
                    icon.source: checked ? Utils.iconUrl("navigation/check") : ""
                    ButtonGroup.group: filterChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Wheelchair access")
                    icon.source: checked ? Utils.iconUrl("navigation/check") : ""
                    ButtonGroup.group: filterChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Dogs ok")
                    icon.source: checked ? Utils.iconUrl("navigation/check") : ""
                    ButtonGroup.group: filterChipsGroup
                }

                Chip {
                    checkable: true
                    text: qsTr("Cats ok")
                    icon.source: checked ? Utils.iconUrl("navigation/check") : ""
                    ButtonGroup.group: filterChipsGroup
                }
            }
        }

        Column {
            spacing: 16

            TitleLabel {
                text: qsTr("Chips")
            }

            Row {
                spacing: 8

                Chip {
                    text: qsTr("Chip")
                }
                Chip {
                    text: qsTr("Deletable chip")
                    deletable: true
                    onDeleted: console.info(qsTr("Deleted"))
                }
            }

            Row {
                spacing: 8

                Chip {
                    text: qsTr("Chip with icon")
                    icon.source: Utils.iconUrl("action/face")
                }
                Chip {
                    text: qsTr("Deletable chip with icon")
                    icon.source: Utils.iconUrl("social/person")
                    deletable: true
                    onDeleted: console.info(qsTr("Deleted"))
                }
            }

            Row {
                spacing: 8

                Chip {
                    iconItem: CircleImage {
                        source: "qrc:/images/balloon.jpg"
                        width: 24
                        height: 24
                    }
                    text: qsTr("Chip with image")
                }
                Chip {
                    iconItem: CircleImage {
                        source: "qrc:/images/balloon.jpg"
                        width: 24
                        height: 24
                    }
                    text: qsTr("Deletable chip with image")
                    deletable: true
                    onDeleted: console.info(qsTr("Deleted"))
                }
            }
        }
    }
}
