#ifndef MAINCLASS_H
#define MAINCLASS_H

#include <QObject>

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

};

#endif // MAINCLASS_H
