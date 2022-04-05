#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "mainclass.h"
#include <QQmlContext>
#include "classfortest.h"
//#include "serialparser.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));

    MainClass *mainClass = new MainClass();
//    SerialParser *serialParser = new SerialParser();


    engine.rootContext()->setContextProperty("mainClass", mainClass);
//    engine.rootContext()->setContextProperty("serialParser", serialParser);
//    const QUrl url(QStringLiteral("qrc:/startWindow/StartWindow.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
