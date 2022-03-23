#include "mainclass.h"

MainClass::MainClass(QObject *parent) : QObject(parent)
{

}

int MainClass::getCountTargets()
{
    return this->countTargets;
}

void MainClass::setCountTargets(int value)
{
    this->countTargets = value;
}

QString MainClass::getDate()
{
   QDate date = QDate::currentDate();
   qDebug() << date.toString("dd.MM.yyyy");
   return date.toString("dd.MM.yyyy");
}

QString MainClass::getTime()
{
    QTime time = QTime::currentTime();
    qDebug() << time.toString("hh:mm");
    return time.toString("mm:ss");
}

int MainClass::getRandom(int min, int max)
{
    qsrand(QDateTime::currentMSecsSinceEpoch());
    qDebug() << (qrand() % ((max + 1) - min) + min);
    return (qrand() % ((max + 1) - min) + min);
}
