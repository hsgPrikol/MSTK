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
