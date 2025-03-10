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

import QtQml.Models
import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Controls.Material
import QtQuick.Layouts
import Fluid as Fluid

/*!
    \brief Application tool bar.

    For more information you can read the
    <a href="https://material.io/guidelines/layout/structure.html#structure-app-bar">Material Design guidelines</a>.
 */
QQC2.ToolBar {
    id: appBar

    Material.elevation: toolbar ? 0 : elevation
    Material.background: toolbar ? toolbar.Material.background : backgroundColor
    Material.theme: Fluid.Color.isDarkColor(Material.background) ? Material.Dark : Material.Light

    /*!
        The back action to display to the left of the title in the action bar.
        When used with a page, this will pick up the page's back action, which
        by default is a back arrow when there is a page behind the current page
        on the page stack. However, you can customize this, for example, to show
        a navigation drawer at the root of your app.

        When using an action bar in a page, set the \ref Page::leftAction instead of
        directly setting this property.
    */
    property Fluid.Action leftAction

    /*!
        A list of actions to show in the action bar. These actions will be shown
        anchored to the right, and will overflow if there are more than the
        maximum number of actions as defined in \ref maxActionCount.

        When used with a page, the actions will be set to the page's \ref Page::actions
        property, so set that instead of changing this directly.
    */
    property list<Fluid.Action> actions

    /*!
        The elevation of the action bar. Set to 0 if you want have a header or some
        other view below the action bar that you want to appear as part of the action bar.
    */
    property int elevation: 2

    property int __iconSize: Fluid.Device.gridUnit <= 48 ? 20 : 24

    /*!
        The background color of the tool bar when the AppBar's page is active.
        By default this is the primary color defined in \c Material.primaryColor
    */
    property color backgroundColor: appBar.Material.primaryColor

    /*!
        Value indicates if overflow menu is open or not.
    */
    readonly property alias overflowMenuVisible: overflowMenu.visible

    /*!
        The background color of the window decoration when the AppBar's page is active,
        usually a darker version of \ref backgroundColor.
        By default this is the primary color defined in \c Material.primaryColor with a
        shade of \c Material.Shade700.
    */
    property color decorationColor: Material.shade(backgroundColor, Material.Shade700)

    /*!
        Keyline to align contents to the left to be visually appealing.
    */
    property alias leftKeyline: titleLabel.x

    /*!
        The maximum number of actions that can be displayed before they spill over
        into a drop-down menu. When using an action bar with a page, this inherits
        from the global \ref AppToolBar::maxActionCount. If you are using an action bar
        for custom purposes outside of a toolbar, this defaults to \c 3.

        Set to \c 0 if you don't want to overflow actions.
    */
    property int maxActionCount: toolbar ? toolbar.maxActionCount : 3

    /*!
        The title displayed in the action bar. When used in a page, the title will
        be set to the title of the page, so set the \ref Page::title property instead
        of changing this directly.
    */
    property alias title: titleLabel.text

    /*!
        Custom content to show instead of the title.
    */
    property alias customContent: customContentItem.data

    /*!
        A custom view to show under the row containing the title and actions.
        Causes the action bar to be extend in height to contain this view.
    */
    property alias extendedContent: extendedContentItem.data

    /*!
        The height of the custom view shown under the row containing the
        title and actions.
    */
    readonly property alias extendedContentHeight: extendedContentItem.height

    /*!
        Tool bar.
    */
    property Fluid.AppToolBar toolbar

    implicitHeight: Fluid.Device.gridUnit

    Behavior on backgroundColor {
        ColorAnimation { duration: Fluid.Units.mediumDuration }
    }

    Behavior on decorationColor {
        ColorAnimation { duration: Fluid.Units.mediumDuration }
    }

    Fluid.ToolButton {
        id: leftButton

        property bool showing: leftAction && leftAction.visible
        property int margin: (width - 24)/2

        QQC2.ToolTip.visible: QQC2.ToolTip.text != "" && (Fluid.Device.isMobile ? pressed : hovered)
        QQC2.ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
        QQC2.ToolTip.text: leftAction ? leftAction.toolTip : ""

        anchors {
            verticalCenter: actionsRow.verticalCenter
            left: parent.left
            leftMargin: leftButton.showing ? 16 - leftButton.margin : -leftButton.width
        }

        icon.width: appBar.__iconSize
        icon.height: appBar.__iconSize
        icon.name: leftAction ? leftAction.icon.name : ""
        icon.source: leftAction ? leftAction.icon.source : ""

        Binding {
            target: leftButton
            property: "icon.color"
            value: leftAction.icon.color
            when: leftAction && leftAction.icon.color.a > 0
        }

        visible: leftAction && leftAction.visible
        enabled: leftAction && leftAction.enabled
        hoverAnimation: leftAction && leftAction.hoverAnimation
        focusPolicy: Qt.TabFocus
        onClicked: {
            if (leftAction)
                leftAction.triggered(leftButton)
        }
    }

    Fluid.TitleLabel {
        id: titleLabel

        anchors {
            verticalCenter: actionsRow.verticalCenter
            left: parent.left
            right: actionsRow.left
            leftMargin: 16 + (leftButton.showing ? Fluid.Device.gridUnit - leftButton.margin : 0)
            rightMargin: 16
        }

        textFormat: Text.PlainText
        color: Material.primaryTextColor
        elide: Text.ElideRight
        visible: text !== "" && customContentItem.children.length === 0
    }

    Row {
        id: actionsRow

        anchors {
            right: parent.right
            rightMargin: 16 - leftButton.margin
        }

        height: appBar.height

        spacing: 24 - 2 * leftButton.margin

        Repeater {
            model: appBar.actions.length > appBar.maxActionCount && appBar.maxActionCount > 0
                   ? appBar.maxActionCount : appBar.actions.length
            delegate: Fluid.ToolButton {
                id: actionButton

                QQC2.ToolTip.visible: QQC2.ToolTip.text !== "" && !overflowMenu.visible && (Fluid.Device.isMobile ? pressed : hovered)
                QQC2.ToolTip.delay: Qt.styleHints.mousePressAndHoldInterval
                QQC2.ToolTip.text: appBar.actions[index].toolTip

                anchors.verticalCenter: parent.verticalCenter

                icon.width: appBar.__iconSize
                icon.height: appBar.__iconSize
                icon.name: appBar.actions[index].icon.name
                icon.source: appBar.actions[index].icon.source

                Binding {
                    target: actionButton
                    property: "icon.color"
                    value: appBar.actions[index].icon.color
                    when: appBar.actions[index].icon.color.a > 0
                }

                visible: appBar.actions[index].visible
                enabled: appBar.actions[index].enabled
                hoverAnimation: appBar.actions[index].hoverAnimation
                focusPolicy: Qt.TabFocus

                onClicked: appBar.actions[index].triggered(actionButton)
            }
        }

        Fluid.ToolButton {
            id: overflowButton

            anchors.verticalCenter: parent.verticalCenter

            icon.width: appBar.__iconSize
            icon.height: appBar.__iconSize
            icon.source: Fluid.Utils.iconUrl("navigation/more_vert")

            onClicked: overflowMenu.open()

            visible: appBar.actions.length > appBar.maxActionCount && appBar.maxActionCount > 0
            focusPolicy: Qt.TabFocus

            QQC2.Menu {
                id: overflowMenu

                x: -width + overflowButton.width - overflowButton.rightPadding
                y: overflowButton.topPadding
                transformOrigin: QQC2.Menu.TopRight

                Instantiator {
                    model: appBar.actions.length > appBar.maxActionCount && appBar.maxActionCount > 0
                           ? appBar.actions.length - appBar.maxActionCount : 0
                    delegate: QQC2.MenuItem {
                        id: overflowMenuItem

                        icon.width: appBar.__iconSize
                        icon.height: appBar.__iconSize
                        icon.name: appBar.actions[index + appBar.maxActionCount].icon.name
                        icon.source: appBar.actions[index + appBar.maxActionCount].icon.source

                        Binding {
                            target: overflowMenuItem
                            property: "icon.color"
                            value: appBar.actions[index + appBar.maxActionCount].icon.color
                            when: appBar.actions[index + appBar.maxActionCount].icon.color.a > 0
                        }

                        text: appBar.actions[index + appBar.maxActionCount].text

                        enabled: appBar.actions[index + appBar.maxActionCount].enabled
                        visible: appBar.actions[index + appBar.maxActionCount].visible

                        onTriggered: appBar.actions[index + appBar.maxActionCount].triggered(overflowMenuItem)
                    }
                    onObjectAdded: (index, object) => overflowMenu.addItem(object)
                    onObjectRemoved: (index, object) => overflowMenu.removeItem(index)
                }
            }
        }
    }

    Item {
        id: customContentItem

        anchors.left: parent.left
        anchors.right: actionsRow.left
        anchors.leftMargin: 16 + (leftButton.showing ? Fluid.Device.gridUnit - leftButton.margin : 0)
        anchors.rightMargin: 16
        anchors.verticalCenter: actionsRow.verticalCenter

        height: parent.height

        visible: children.length > 0
    }

    Item {
        id: extendedContentItem

        anchors.left: titleLabel.left
        anchors.top: actionsRow.bottom
        anchors.right: actionsRow.right
        anchors.rightMargin: 16

        height: childrenRect.height

        visible: children.length > 0
    }

    /*!
        Toggle the overflow menu if the number of actions is greater than \ref AppBar::maxActionCount.
    */
    function toggleOverflowMenu() {
        if (!overflowButton.visible)
            return;

        if (overflowMenu.visible)
            overflowMenu.close();
        else
            overflowMenu.open();
    }
}
