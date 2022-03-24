#include "mainclass.h"

MainClass::MainClass(QObject *parent) : QObject(parent)
{
    this->timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(emitSignalToQml()));
    goalColorCopter = QColor(255, 0, 0, 255);
}

void MainClass::emitSignalToQml()
{
    emit onGetDate();
    emit onGetTime();

    if (isCalcXRow)
    {
        emit onCalcXRow();
    }
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

void MainClass::setIsCalcXRow(bool isCalc)
{
    this->isCalcXRow = isCalc;
}

int MainClass::getCountTargets()
{
    return this->countTargets;
}

void MainClass::setCountTargets(int value)
{
    this->countTargets = value;
    tableHitsTime.resize(value);

    for(int i = 0; i < value; i++)
    {
        tableHitsTime[i].resize(13);
    }
}

QString MainClass::getDate()
{
    QDate date = QDate::currentDate();
//    qDebug() << date.toString("dd.MM.yyyy");
    return date.toString("dd.MM.yyyy");
}

QString MainClass::getTime()
{
    QTime time = QTime::currentTime();
//    qDebug() << time.toString("mm:ss");

    return time.toString("hh:mm");;
}

int MainClass::getRandom(int min, int max)
{
    qsrand(QDateTime::currentMSecsSinceEpoch());
    //    qDebug() << (qrand() % ((max + 1) - min) + min);
    return (qrand() % ((max + 1) - min) + min);
}

void MainClass::startTimerGeneral()
{
    timer->start(500);
}

void MainClass::stopTimerGeneral()
{
    timer->stop();
}

void MainClass::newHit(int zone, int target)
{    
    ((tableHitsTime[target])[zone]).append(QTime::currentTime());

    emit onNewHitCopterUpdateColor(zone, getNextColorForZone(((tableHitsTime[target])[zone]).size()));
    emit onNewHitCopter(target, zone);
}

void MainClass::setStartColor(QColor color)
{
    startColorCopter = color;
}
