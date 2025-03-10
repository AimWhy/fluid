/*
 * This file is part of Fluid.
 *
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
import QtQuick.Controls
import QtTest
import Fluid

Item {
    width: 400
    height: 400

    Column {
        anchors.fill: parent

        ListItem {
            id: listItem

            width: 200

            SignalSpy {
                id: clickedSpy
                target: listItem
                signalName: "clicked"
            }
        }

        ListItem {
            id: listItemWithSubtext1

            maximumLineCount: 2
            subText: "Random Text"
        }

        ListItem {
            id: listItemWithSubtext2

            maximumLineCount: 3
            subText: "Random Text\nRandom Text\nRandom Text"
        }

        ListItem {
            id: listItemWithSecondaryItem

            secondaryItem: Item {
                width: parent.width
                height: 90
            }
        }

        ListItem {
            id: listItemWithoutSecondaryItem
        }

        ListItem {
            id: listItemWithLeftItem

            icon.source: Utils.iconUrl("action/settings")
        }

        ListItem {
            id: listItemWithRightItem

            text: "Random Text"
            rightItem: Item {
                width: parent.width
                height: 70
            }
        }
    }

    TestCase {
        name: "ListItemTests"
        when: windowShown

        function test_leftItem_shows_when_icon_name_is_set() {
            var leftItem = findChild(listItem, "leftItem");

            compare(leftItem.showing, false);

            listItem.icon.name = "action/settings";
            compare(leftItem.showing, true);
            listItem.icon.name = "";
        }

        function test_leftItem_shows_when_icon_source_is_set() {
            var leftItem = findChild(listItem, "leftItem");

            compare(leftItem.showing, false);

            listItem.icon.source = Utils.iconUrl("action/settings");
            compare(leftItem.showing, true);
            listItem.icon.source = "";
        }

        function test_click_isnt_eaten_by_ripple() {
            clickedSpy.clear();
            mouseClick(listItem);
            compare(clickedSpy.count, 1);
        }

        function test_implicit_height() {
            compare(listItemWithSubtext1.implicitHeight, 48);
            compare(listItemWithSubtext2.implicitHeight, 60);
            compare(listItemWithSecondaryItem.implicitHeight, 106);
            compare(listItemWithoutSecondaryItem.implicitHeight, 48);
            compare(listItemWithLeftItem.implicitHeight, 48);
            compare(listItemWithRightItem.implicitHeight, 86);
        }
    }
}
