#ifndef MAINCLASS_H
#define MAINCLASS_H

#include <QObject>
#include <QDateTime>
#include <QDebug>

class MainClass : public QObject
{
    Q_OBJECT
public:
    explicit MainClass(QObject *parent = nullptr);

    int countTargets;

signals:

public slots:
    int getCountTargets();

    void setCountTargets(int value);

    QString getDate();

    QString getTime();

    int getRandom(int min, int max);

};

#endif // MAINCLASS_H
