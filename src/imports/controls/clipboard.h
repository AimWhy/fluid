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

#pragma once

#include <QObject>
#include <QClipboard>
#include <QtQml/qqmlregistration.h>

/*!
    \brief Clipboard.
*/
class Clipboard : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
    QML_ELEMENT
public:
    explicit Clipboard(QObject *parent = nullptr);

    /*!
        This property holds the clipboard text.
    */
    QString text() const;

    /*!
        Clear the global clipboard contents.
    */
    Q_INVOKABLE void clear();

public Q_SLOTS:
    void setText(const QString &text);

Q_SIGNALS:
    void textChanged();

private:
    QClipboard *m_clipboard = nullptr;
};

