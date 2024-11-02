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

#pragma once

#include <QLocale>
#include <QQuickItem>

class Picker : public QQuickItem
{
    Q_OBJECT
    /*!
        This property holds the locale of the control.
    */
    Q_PROPERTY(QLocale locale READ locale WRITE setLocale NOTIFY localeChanged FINAL)
    /*!
        This property holds the date picker orientation.
        The default value is automatically selected based on the device orientation.

        Possible values:
          - DatePicker.Landscape The date picker is landscape.
          - DatePicker.Portrait The date picker is portrait.
    */
    Q_PROPERTY(Orientation orientation READ orientation WRITE setOrientation RESET resetOrientation NOTIFY orientationChanged FINAL)
    /*!
        This property holds the background item.
    */
    Q_PROPERTY(QQuickItem *background READ background WRITE setBackground NOTIFY backgroundChanged FINAL)
    /*!
        This property holds the header item.
    */
    Q_PROPERTY(QQuickItem *header READ header WRITE setHeader NOTIFY headerChanged FINAL)
    /*!
        This property holds the selector item.
    */
    Q_PROPERTY(QQuickItem *selector READ selector WRITE setSelector NOTIFY selectorChanged FINAL)
    /*!
        This property holds the footer item.
    */
    Q_PROPERTY(QQuickItem *footer READ footer WRITE setFooter NOTIFY footerChanged FINAL)
    Q_DISABLE_COPY(Picker)
public:
    enum Orientation {
        Landscape,
        Portrait
    };
    Q_ENUM(Orientation)

    explicit Picker(QQuickItem *parent = nullptr);

    QLocale locale() const;
    void setLocale(const QLocale &locale);

    Orientation orientation() const;
    void setOrientation(Orientation orientation);
    void resetOrientation();

    QQuickItem *background() const;
    void setBackground(QQuickItem *item);

    QQuickItem *header() const;
    void setHeader(QQuickItem *item);

    QQuickItem *selector() const;
    void setSelector(QQuickItem *item);

    QQuickItem *footer() const;
    void setFooter(QQuickItem *item);

Q_SIGNALS:
    void localeChanged();
    void orientationChanged();
    void backgroundChanged();
    void headerChanged();
    void selectorChanged();
    void footerChanged();
    void accepted(const QDate &date);
    void rejected();

protected:
    void componentComplete() override;
    void geometryChange(const QRectF &newGeometry, const QRectF &oldGeometry) override;

private:
    QLocale m_locale;
    bool m_hasOrientation = false;
    Orientation m_orientation = Landscape;
    QQuickItem *m_background = nullptr;
    QQuickItem *m_header = nullptr;
    QQuickItem *m_selector = nullptr;
    QQuickItem *m_footer = nullptr;

    bool updateOrientation();
    void updateLayout();
};

