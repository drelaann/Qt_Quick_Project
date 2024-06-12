#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QTextStream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QProcess>
#include <QDebug>
#include "myclass.h"

QString readAndDisplayText(const QString &filePath) {
    // Создаем объект QFile и связываем его с файлом
    QFile file(filePath);

    // Открываем файл в режиме чтения
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        qWarning("Cannot open file for reading");
        return QString();
    }

    // Создаем QTextStream для чтения данных
    QTextStream in(&file);
    QString content = in.readAll(); // Читаем весь файл
    file.close();
    return content;
}

bool executeCapsLockCommand() {
    QProcess process;
    process.start("bash", QStringList() << "-c" << "xset q | grep 'Num Lock:' | awk '{print $4}'");
    process.waitForFinished();
    QString result1 = process.readAllStandardOutput().trimmed();
    bool res1;
    if (result1 == "on"){
        res1 = true;
    }
    else{
        res1 = false;
    }
    return res1;
}

bool executeNumLockCommand() {
    QProcess process;
    process.start("bash", QStringList() << "-c" << "xset q | grep 'Num Lock:' | awk '{print $8}'");
    process.waitForFinished();
    QString result = process.readAllStandardOutput().trimmed();
    bool res;
    if (result == "on"){
        res = true;
    }
    else{
        res = false;
    }
    return res;
}

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    bool executeCapsLock = executeCapsLockCommand();
    bool executeNumLock = executeNumLockCommand();
    engine.rootContext()->setContextProperty("executeCapsLock", executeCapsLock);
    engine.rootContext()->setContextProperty("executeNumLock", executeNumLock);
    QString str;
    str = readAndDisplayText("/proc/devices");
    engine.rootContext()->setContextProperty("page1Text", str);
    engine.rootContext()->setContextProperty("page2Text", readAndDisplayText("/proc/cpuinfo"));
    engine.rootContext()->setContextProperty("page3Text", readAndDisplayText("/proc/meminfo"));
    engine.rootContext()->setContextProperty("page5Text", readAndDisplayText("/home/zenov/Project/untitled5/dmesg.txt"));
    engine.rootContext()->setContextProperty("page6Text", readAndDisplayText("/home/zenov/Project/untitled5/algoritm.txt"));
    engine.rootContext()->setContextProperty("textSize", 10);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    MyClass myobj; // объект класса, который передает команды в терминал
    engine.rootContext()->setContextProperty("myobj", &myobj);
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated, [&]() {
//                QObject *root = engine.rootObjects().first();
//                if (root) {
//                    QObject::connect(root, SIGNAL(toggleIndicator(int)), &engine, SLOT(toggleIndicator(int)));
//                }
//            });

    return app.exec();
}
