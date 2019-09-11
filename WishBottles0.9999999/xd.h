#ifndef XD_H
#define XD_H
//#ifndef MAINWINDOW_H
//#define MAINWINDOW_H
//#include <QMainWindow>
//#include <QRadioButton>
//#include <QGroupBox>
//#include <QPlainTextEdit>
//#include <QPushButton>
//#include <QHBoxLayout>
#include <QObject>
#include <QFont>
#include <QTextStream>
#include <QFile>
#include <QtCore>
#include <QIODevice>
#include <QDebug>
#include <QDate>
#include <QDir>
#include <QString>
//#include <QMessageBox>
#include <QList>


//namespace Ui {
//class MainWindow;
//}

class XD:public QObject
{
    Q_OBJECT

private:

    QFile *file;
//    QTimer clk;
    QTextStream *QIODevice;
    QString *str;
    QString time;
    QString xinyuan;
   // QString text;
  //  void iniUI();//UI 创建与初始化
//    Ui::MainWindow *ui;        // 声明一个子类
public:
   // explicit XD(QWidget *parent=nullptr);
     XD();
    ~XD();
    Q_INVOKABLE void loading(int i);
    Q_INVOKABLE void bug();
     Q_INVOKABLE int lstc;
     Q_INVOKABLE  int num;
     Q_INVOKABLE QList<QString> lst;
signals:
    Q_INVOKABLE void fasong();
     Q_INVOKABLE void sign1();
     Q_INVOKABLE void againxd1();
     Q_INVOKABLE void sign2();
     Q_INVOKABLE void sign3();
     Q_INVOKABLE void xinhao3();
public slots:
    int relstc();
    void getlstc();
    void saveTxt();
    void resetnum();
    int renum();
    void numadd1();
    bool judge(int n);
    void againxd();
    void ssign2();
    void next();
  //  void yinfa3();
//    void readTxt();
    QString sendDate();
    QString sendXinyuan();
    QString sendContent(QString content);
//    void on_pBtnCancel_clicked();
//    void on_pBtnStore_clicked();
//    void on_pBtnSearch_clicked();
};

#endif // XD_H




