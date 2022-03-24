#ifndef MAINCLASS_H
#define MAINCLASS_H

#include <QObject>
#include <QDateTime>
#include <QDebug>
#include <QColor>

class MainClass : public QObject
{
    Q_OBJECT
private:
    QColor startColorCopter;
    QColor goalColorCopter;

    const int MAX_COUNT_HIT = 5;

    QVector<QVector<QTime>> tableHitsTime;

public:
    explicit MainClass(QObject *parent = nullptr);

    int countTargets;

signals:
    void onNewHitCopter(int zone, QColor newColor);

public slots:
    int getCountTargets();

    void setCountTargets(int value);

    QString getDate();

    QString getTime();

    int getRandom(int min, int max);

    void newHit(int zone);

    void setStartColor(QColor color);

    QColor getNextColorForZone(int currentCountHit);

};

#endif // MAINCLASS_H
