#include <QApplication>
#include <QQmlApplicationEngine>
#include "documenthandler.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    qmlRegisterType<DocumentHandler>("DocumentHandler", 1, 0, "DocumentHandler");
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/qml/main.qml")));
    return app.exec();
}
