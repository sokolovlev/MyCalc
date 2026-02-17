//
// Created by Lev on 17.02.2026.
//

#ifndef MYCALC_PARSERCLASSQML_H
#define MYCALC_PARSERCLASSQML_H

#include <QObject>
#include <QString>
#include "ParserClass.h"

class ParserClassQML : public QObject
{
    Q_OBJECT
public:
    explicit ParserClassQML(QObject *parent = nullptr) : QObject(parent) {}

    Q_INVOKABLE double evaluate(const QString &expression)
    {
        try
        {
            ParserClass parser(expression);
            return parser.evaluate();
        } catch (const std::exception &e)
        {
            qWarning("Parser error: %s", e.what());
            return 0.0;
        }
    }
};

#endif //MYCALC_PARSERCLASSQML_H