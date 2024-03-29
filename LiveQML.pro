TEMPLATE = app

QT += qml quick widgets multimedia

#include($$quote(qt-labs-qml-presentation-system)/src/src.pro)

SOURCES += src/main.cpp \
    src/documenthandler.cpp \
    src/qmlhighlighter.cpp

HEADERS += \
    src/qmlhighlighter.h \
    src/documenthandler.h

RESOURCES += qml.qrc

#QML_FILES += qml/main.qml

OTHER_FILES += Colors.js #$$QML_FILES \

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
