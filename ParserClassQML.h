//
// Created by Lev on 17.02.2026.
//

#ifndef MYCALC_PARSERCLASSQML_H
#define MYCALC_PARSERCLASSQML_H

#include <QObject>
#include <QString>
#include <QDebug>
#include "ParserClass.h"

class ParserClassQML : public QObject
{
    Q_OBJECT

public:
    explicit ParserClassQML(QObject *parent = nullptr)
        : QObject(parent) {}

    Q_INVOKABLE QString evaluate(const QString &expression)
    {
        try
        {
            ParserClass parser(expression);
            return parser.evaluateToString(25);  // 25 знаков после запятой
        }
        catch (const std::exception &e)
        {
            qWarning() << "Parser error:" << e.what();
            return "Error";
        }
    }
};

#endif // MYCALC_PARSERCLASSQML_H