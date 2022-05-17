#ifndef MAINCLASS_H
#define MAINCLASS_H

#include <QObject>
#include <QDateTime>
#include <QDebug>
#include <QTimer>
#include <QColor>
#include <QArrayData>
#include <QQuickItem>
#include <serialparser.h>
#include <QtSerialPort/QSerialPortInfo>

class MainClass : public QObject
{
    Q_OBJECT
private:
    QColor startColorCopter;
    QColor goalColorCopter;

    const int MAX_COUNT_HIT = 5;

    bool isCalcXRow = true;


    QVector<QSerialPortInfo> arrayComPort;
    QVector<QString> arrayPortName;
    QString portName;


    QVector<QVector<QVector<QTime>>> tableHitsTime;

    const int TIMER_INTERVAL = 30;

    QTime durationTraining;

    float cffSpeedPlay;

    const int MAX_COUNT_ZONE = 13;
    const int MAX_COUNT_TARGET = 2;


public:
    explicit MainClass(QObject *parent = nullptr);

    int countTargets;
    QTimer *timer;
    SerialParser *serial;



signals:

    void onTestNewHit(int zone, QColor newColor);
    void onNewHitCopterUpdateColor(int zone, QColor newColor);
    void onNewHitCopter(int target, int zone);

    void onGetTime();
    void onGetDate();

    void on100ms();
    void on500ms();
    void on1000ms();
    void on5000ms();

    void onCalcXRow();

public slots:

    QVector<QString> getArrayPortName();

    void emitSignalToQml();

    int getCountTargets();

    void setCountTargets(int value);

    QString getDate();

    QString getTime();

    int getRandom(int min, int max);

    void startTimerGeneral();
    void stopTimerGeneral();

    void newHit(int zone, int target);

    void setStartColor(QColor color);

    QColor getNextColorForZone(int currentCountHit);

    void setIsCalcXRow(bool isCalc);
    bool getIsCalcXRow();

    int getTIMER_INTERVAL();

    int getDurationTrainingMSec();

    int getDurationTrainingSec();

    void setCffSpeedPlay(float value);

    //    void AppendHitsFromSave(QQuickItem parent, QString path);
    int getSizeArrayPortName();
};

#endif // MAINCLASS_H
