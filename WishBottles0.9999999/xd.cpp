#include "xd.h"
#include<QDebug>
//#include "XD.h"
//#include "ui_XD.h"
XD::XD(){
    //connect(,SIGNAL(fasong()),this,SLOT(saveTxt()));
    file = new QFile;
    QIODevice = new QTextStream;
    str = new QString;
    num=1;
}
XD::~XD(){
    file->deleteLater();

}
void XD::resetnum()
{
    qDebug()<<"reset"<<num;
    num=1;
}
int XD::renum()
{
    qDebug()<<"num此事为"<<num;
    return num;
}

void XD::numadd1()
{
    num=num+1;
}

bool XD::judge( int n)
{
    if(lst[2*n-1]=="\n")
    {
        return 0;
    }
    else
    {
        return 1;
    }
}

void XD::againxd()
{
    emit againxd1();
}

void XD::loading(int i)
{

//    int count=lst.count();
//    for(int i=1;i<((lst.count()-1)/2);i++){
        time=lst[2*i-2];
        qDebug()<<"time"<<time;

        xinyuan=lst[2*i-1];
        qDebug()<<"xinyuan"<<xinyuan;


//    }




}

void XD::ssign2()
{
    emit sign2();
}

void XD::next()
{
    qDebug()<<"发送信号3";
    emit sign3();
}

//void XD::yinfa3()
//{
//    emit xinhao3();
//}

void XD::getlstc()
{
    num=1;
    qDebug()<<"获取总数，num置1"<<num;
    QString displayString;
    QFile file("D:\\test.txt");
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text | QIODevice::Append)){
        qDebug()<<"open failed!";

    }
    qDebug()<<"open successed";
    QTextStream txtInput(&file);
    QString lineStr = txtInput.readLine();


    txtInput.seek(file.size());

    txtInput.seek(0);
  //  while (!txtInput.atEnd()) {
        lineStr = txtInput.readLine()+"\n";
        displayString.append(lineStr);
        qDebug() << lineStr;
   // }



//    qDebug()<<"2"<<lineStr;
//    ui->plainTextEdit->clear();
//    ui->plainTextEdit->setPlainText(displayString);
//    qDebug()<<"3"<<lineStr;


  //  QList<QString> lst;
qDebug() << lineStr;
    lst.clear();
    lst=lineStr.split('#');
    qDebug()<<"lst"<<lst;
    qDebug()<<"lstcount"<<lst.count();
    file.close();
    lstc=lst.count();
    emit sign1();

}
int XD::relstc()
{
    return lstc;
}

void XD::bug()
{
    qDebug()<<"run";
}
//保存数据文本
void XD::saveTxt()
{

     QFile file("D:\\test.txt");

     if (!file.open(QIODevice::WriteOnly | QIODevice::Text |QIODevice::Append)){
         qDebug()<<"open failed!";
         return;
     }
     QTextStream out(&file);
   // QString abc=QDate::currentDate().toString("yyyy-MM-dd") + "#" +str+"#";
     //out << QDate::currentDate().toString("yyyy-MM-dd") << "#" ;
    // out <<file.write(str->toUtf8())<<"#";
   // out << abc;
   //  qDebug()<<abc;
     QString day=QDate::currentDate().toString("yyyy-MM-dd")+"#";
     file.write(day.toUtf8());
    file.write(str->toUtf8()+"#");
//     out << "#";
     out.flush();
     file.close();
     emit xinhao3();

}

QString XD::sendDate()
{
    return time;

}

QString XD::sendXinyuan()
{
    return  xinyuan;
}

//读取数据
//void XD::readTxt()
//{
//    QString displayString;
//    QFile file("D:\\test.txt");
//    if (!file.open(QIODevice::ReadOnly | QIODevice::Text | QIODevice::Append)){
//        qDebug()<<"open failed!";
//        return;
//    }
//    QTextStream txtInput(&file);
//    QString lineStr = txtInput.readLine();
//    txtInput.seek(file.size());
////    int count = 0;
////    while(count < 10)
////    {
////        txtInput << QObject::trUtf8("新建行：") << ++count << "\n";
////    }
//    txtInput.seek(0);
//    while (!txtInput.atEnd()) {
//        lineStr = txtInput.readLine()+"\n";
//        displayString.append(lineStr);
//        qDebug() << lineStr;
//    }
//    qDebug()<<"2"<<lineStr;
////    ui->plainTextEdit->clear();
////    ui->plainTextEdit->setPlainText(displayString);
//    qDebug()<<"3"<<lineStr;
//    file.close();
//}

QString XD::sendContent(QString content)
{
    str=&content;
    saveTxt();
    //emit fasong();

}

