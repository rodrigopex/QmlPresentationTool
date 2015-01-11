#ifndef STORAGE_H
#define STORAGE_H

#include <QObject>

class Storage : public QObject
{
    Q_OBJECT
    explicit Storage(QObject *parent = 0): QObject(parent) {}
    Storage(const Storage&) {}
    void operator =(const Storage&) {}
public:
    ~Storage();
    static Storage * instance() {
        static Storage s_instance;
        return &s_instance;
    }

public slots:
    void exportAllQml(const QUrl &dirPath);
    void clearAllQml();
};

#endif // STORAGE_H
