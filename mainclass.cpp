#include "mainclass.h"

MainClass::MainClass(QObject *parent) : QObject(parent)
{

}

int MainClass::getCountTargets()
{
    return countTargets;
}

void MainClass::setCountTargets(int value)
{
    countTargets = value;
}
