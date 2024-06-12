#include "myclass.h"
#include <QDebug>
#include <QProcess>
#include <QString>

MyClass::MyClass(QObject *parent) : QObject(parent)
{

}

void MyClass::driver3Call(){
    QProcess process;
    process.start("./Driver3");
    process.waitForFinished(-1);
    qDebug() << "driver3 run\n";
}
