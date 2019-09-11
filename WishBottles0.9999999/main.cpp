#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include<QtQml>
#include"tcp.h"
#include"xd.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    //注册login类
     qmlRegisterType<TCPClient>("TCPClient", 1, 0, "TCPClient");
     qmlRegisterType<XD>("XD", 1, 0, "XD");

    //QVariant returnedValue;
   //  QVariant msg1=”Hello from C++”;
   // QMetaObject::invokeMethod(,"judge",Q_RETURN_ARG(QVariant,returnedValue));

   //engine.rootContext()->setContextProperty("TCPClient",&);

    QQmlApplicationEngine engine;
    TCPClient tcp;
    XD xxdd;

    engine.rootContext()->setContextProperty("$TCPClient",&tcp);
    engine.rootContext()->setContextProperty("$XD",&xxdd);


    const QUrl url(QStringLiteral("qrc:/main.qml"));

//    QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/main.qml")));
//    QObject* object=component.create();
//    object->setProperty("source","/Login_success.qml");



    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
