#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQuickControls2>
#include <QFontDatabase>
#include "SecretSignal.h"
#include "ParserClassQML.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    int fontId = QFontDatabase::addApplicationFont(":/fonts/OpenSansSemibold.ttf");      //"Open Sans"
    QStringList families = QFontDatabase::applicationFontFamilies(fontId);      //  список названий добавленных шрифтов

    qmlRegisterSingletonType(QUrl("qrc:/main/CalculationData.qml"), "MyCalc", 1, 0, "DataString");
    qmlRegisterSingletonType(QUrl("qrc:/main/Last3sym.qml"), "MyCalc", 1, 0, "Last3sym");
    qmlRegisterSingletonType(QUrl("qrc:/main/Result.qml"), "MyCalc", 1, 0, "Result");

    SecretSignal *notifier = new SecretSignal();
    engine.rootContext()->setContextProperty("SecretSignal", notifier);

    QString OpenSansSemibold = families.at(0);         // название первого шрифта
    engine.rootContext()->setContextProperty("OpenSansSemibold", OpenSansSemibold);

    ParserClassQML parser;
    engine.rootContext()->setContextProperty("parser", &parser);

    engine.load(QUrl(QStringLiteral("qrc:/main/Main.qml")));

    return app.exec();
}