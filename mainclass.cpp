#include "mainclass.h"

MainClass::MainClass(QObject *parent) : QObject(parent)
{
    tableHitsTime.resize(13);

    goalColorCopter = QColor(255, 0, 0, 255);
}

QColor MainClass::getNextColorForZone(int currentCountHit)
{
    if(currentCountHit > MAX_COUNT_HIT)
    {
        currentCountHit = MAX_COUNT_HIT;
    }

    return QColor(
                    startColorCopter.red() + (((goalColorCopter.red() - startColorCopter.red()) / (float)MAX_COUNT_HIT) * (float)currentCountHit),
                    startColorCopter.green() + (((goalColorCopter.green() - startColorCopter.green()) / (float)MAX_COUNT_HIT) * (float)currentCountHit),
                    startColorCopter.blue() + (((goalColorCopter.blue() - startColorCopter.blue()) / (float)MAX_COUNT_HIT) * (float)currentCountHit),
                    255
                );
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
//    qDebug() << (qrand() % ((max + 1) - min) + min);
    return (qrand() % ((max + 1) - min) + min);
}

void MainClass::newHit(int zone)
{
    tableHitsTime[zone].append(QTime::currentTime());

    emit onNewHitCopter(zone, getNextColorForZone(tableHitsTime[zone].size()));
}

void MainClass::setStartColor(QColor color)
{
    startColorCopter = color;
}
