#ifndef MYCLASS_H
#define MYCLASS_H

#include <QObject>

class MyClass : public QObject
{
    Q_OBJECT
public:
    explicit MyClass(QObject *parent = nullptr);

signals:

public slots:
    void driver3Call(); //запускает исполняемый файл driver3 через терминал
};

#endif // MYCLASS_H
