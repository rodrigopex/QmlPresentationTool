#include "Storage.hpp"
#include <QSettings>
#include <QFile>
#include <QDir>
#include <QDebug>
#include <QUrl>

Storage::~Storage()
{

}

void Storage::exportAllQml(const QUrl &dirPath)
{
    QSettings settings;
    settings.beginGroup("code");
    foreach (QString codeId, settings.childKeys()) {
        QString fileName = QString("%1%2%3.qml").arg(dirPath.toLocalFile()).arg(QDir::separator()).arg(codeId);
        QFile codeFile(fileName);
        if (!codeFile.open(QFileDevice::WriteOnly | QIODevice::Text)) {
            qDebug() << "Could no export files" << codeFile.errorString();
            return;
        }
        codeFile.write(settings.value(codeId).value<QString>().toLatin1());
        codeFile.close();
    }
}

void Storage::clearAllQml()
{
    QSettings settings;
    settings.remove("code");
}
