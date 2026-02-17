//
// Created by Lev on 16.02.2026.
//

#ifndef MYCALC_SECRETSIGNAL_H
#define MYCALC_SECRETSIGNAL_H

#pragma once
#include <QObject>

class SecretSignal : public QObject
{
    Q_OBJECT

public:
    explicit SecretSignal(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE void triggerSecret()
    {
        emit secretTriggered();
    }

    signals:
        void secretTriggered();
};



#endif //MYCALC_SECRETSIGNAL_H