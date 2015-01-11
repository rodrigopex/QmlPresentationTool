#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "documenthandler.h"
#include "Storage.hpp"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<DocumentHandler>("DocumentHandler", 1, 0, "DocumentHandler");
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("_storage", Storage::instance());
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    return app.exec();
}
