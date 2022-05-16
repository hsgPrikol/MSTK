#include "mainclass.h"

int MainClass::getTIMER_INTERVAL()
{
    return TIMER_INTERVAL;
}

int MainClass::getDurationTrainingMSec()
{
    static QTime zeroTime = QTime(0, 0, 0, 0);

    return zeroTime.msecsTo(durationTraining);
}

int MainClass::getDurationTrainingSec()
{
    static QTime zeroTime = QTime(0, 0, 0, 0);

    return zeroTime.secsTo(durationTraining);
}

bool MainClass::getIsCalcXRow()
{
    return isCalcXRow;
}

void MainClass::setCffSpeedPlay(float value)
{
    cffSpeedPlay = value;
}


//void MainClass::AppendHitsFromSave(QQuickItem parent, QString path)
//{
//    //890 stranica
//}

MainClass::MainClass(QObject *parent) : QObject(parent)
{
    this->timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(emitSignalToQml()));
    goalColorCopter = QColor(255, 0, 0, 255);
    durationTraining = QTime(0, 0, 0, 0);
    cffSpeedPlay = 1.0;

    serial = new SerialParser(this);
    connect(serial, &SerialParser::onNewHit, this, &MainClass::newHit);

    //сразу проинициализирую массив данных
    tableHitsTime.resize(3);

    for(int i = 0; i < tableHitsTime.size(); i++)
    {
        tableHitsTime[i].resize(13);
    }
}

void MainClass::emitSignalToQml()
{
    static int counter = 0;

    if (isCalcXRow)
    {
        durationTraining = durationTraining.addMSecs(static_cast<int>(((float)(TIMER_INTERVAL) * cffSpeedPlay)));
        emit onCalcXRow();
    }

    counter += TIMER_INTERVAL;

    if(counter % 100 == 0)
    {
        emit on100ms();
    }

    if(counter % 500 == 0)
    {
        emit on500ms();
    }

    if(counter % 1000 == 0)
    {
        emit on1000ms();
    }

    if(counter % 5000 == 0)
    {
        emit on5000ms();

        counter = 0;
    }

    emit onGetDate();
    emit onGetTime();


}

QColor MainClass::getNextColorForZone(int currentCountHit)
{
    qDebug() << "getNextColorForZone  =" << currentCountHit;
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
    //    durationTraining = QTime(0, 0, 0, 0);
    timer->start(TIMER_INTERVAL);
}

void MainClass::stopTimerGeneral()
{
    timer->stop();
}

void MainClass::newHit(int target, int zone)
{
    qDebug() << "onNewHit";

    if((target < MAX_COUNT_TARGET) && (zone < MAX_COUNT_ZONE))
    {
        qDebug() << "target" << target << "zone" << zone;
        qDebug() << "zone" << zone << "target" << target;
        ((tableHitsTime[target])[zone]).append(QTime::currentTime());


        emit onNewHitCopterUpdateColor(zone, getNextColorForZone(((tableHitsTime[target])[zone]).size()));
        emit onNewHitCopter(target, zone);
    }
    else
    {
        qDebug() << "ERROR: Выход за переделы\ntarget_max = " << MAX_COUNT_TARGET << "current value target = " << target << "\nzone max = " << MAX_COUNT_ZONE << "current value zone = " << zone;
    }

}

void MainClass::setStartColor(QColor color)
{
    startColorCopter = color;
}
