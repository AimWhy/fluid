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

/*!
    \brief Manages the page stack used for navigation.
*/
StackView {
    id: stackView

    /*!
        This signal is emitted when a \a page is pushed to the stack.
    */
    signal pushed(Item page)

    /*!
        This signal is emitted when a \a page is popped from the stack.
    */
    signal popped(Item page)


    /*!
        This signal is emitted when a \a page is replaced in the stack.
    */
    signal replaced(Item page)

    property int __lastDepth: 0
    property Item __oldItem: null

    onCurrentItemChanged: {
        if (stackView.currentItem) {
            stackView.currentItem.canGoBack = stackView.depth > 1;
            stackView.currentItem.forceActiveFocus()

            if (__lastDepth > stackView.depth) {
                popped(stackView.currentItem);
            } else if (__lastDepth < stackView.depth) {
                pushed(stackView.currentItem);
            } else {
                replaced(stackView.currentItem);
            }
        }

        __lastDepth = stackView.depth;
    }
}
