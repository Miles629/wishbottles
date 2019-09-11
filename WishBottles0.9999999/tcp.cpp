
#include "tcp.h"
#include <QDebug>


TCPClient::TCPClient(){
    m_ip = "192.168.43.119";
    m_port = 1200;
    m_tcpsocket = new QTcpSocket();
    n=1;
    pln=1;
    /*-<连接信号槽 */
    qDebug()<<"create a default TCP client!";
    connect(m_tcpsocket,&QTcpSocket::connected,this,&TCPClient::onConnected,Qt::AutoConnection);
    connect(m_tcpsocket,&QTcpSocket::readyRead,this,&TCPClient::getMsg,Qt::AutoConnection);
    //connect(m_tcpsocket,&QTcpSocket::readyRead,this,&TCPClient::cread,Qt::AutoConnection);
}


TCPClient::~TCPClient(){
    m_tcpsocket->deleteLater();
}



void TCPClient::setIP(const QString ip){
    m_ip = ip;
    qDebug()<<"set IP: "<<ip;
}

void TCPClient::setPort(const int port){
    m_port = port;
    qDebug()<<"set port: "<<port;
}

void TCPClient::closeww()
{
    emit closew();

}
void TCPClient::showpl(int now)
{
    plnum=now;
    qDebug()<<"showpl执行，plnum获得当前下标"<<plnum;
    emit showpl2();
}
void TCPClient::wypl(int now)
{
    plnum=now;
    qDebug()<<"wypl执行，plnum获得当前下标"<<plnum;

}

void TCPClient::toregis1()
{
    emit toregis();

}

void TCPClient::cstoc1()
{
    emit cstoc();
}

void TCPClient::ctocs1()
{
    emit ctocs();
}

void TCPClient::showw1()
{
    emit showw();
}

void TCPClient::hidecs1()
{
    emit hidecs();
}

int TCPClient::recount()
{
    qDebug()<<"recount执行"<<m_count;
    return m_count;
}

void TCPClient::onConnected(){
    qDebug()<<"already connect the host : "<<m_ip;
    emit qthing();
}
//void qthing(){

//}

int TCPClient::rei()
{

    qDebug()<<"rei执行"<<denglu;
    return denglu;
}
int TCPClient::ren()
{
    qDebug()<<"ren执行返回n为"<<n;
    return n;
}
int TCPClient::repln()
{
    qDebug()<<"repln执行"<<pln;
    return pln;
}
void TCPClient::nadd1()
{
    n=n+1;
}

void TCPClient::plnadd1()
{
    pln=pln+1;
}

int TCPClient::replc()
{
    qDebug()<<"replc执行返回"<<plc;
    return plc;
}
QString TCPClient::rename()
{
    qDebug()<<"name传递";
   // nn=m_name;
    return oname;
}
QString TCPClient::myname()
{
    return m_name;
}
void TCPClient::cread()
{
    qDebug()<<"canread";
}
void TCPClient::reask()
{
    emit again();
}
void TCPClient::reaskpl()
{
    emit plagain();
}
QString TCPClient::remsg()
{
    qDebug()<<"读取该用户信息";
    return mesg;
}
QString TCPClient::repl()
{
    qDebug()<<"repl执行，返回当前循环评论为"<<pingl;
    return pingl;
}
void TCPClient::resetpln()
{
    pln=1;
}

//}
qint64 TCPClient::getMsg(){

    qDebug()<<"read sev data-----------------";
    QByteArray buffer;
    buffer = m_tcpsocket->readLine();/*-<读取数据 */
    qDebug()<<"getMsg"<<buffer;
    //emit showMsg(buffer); /*-<触发信号，显示在界面上 */
   // QString dl=buffer.toStdString();
    //  QMessageBox::about(NULL,"Welcome to lake of stars","登陆成功");
    //  this->hide();
     // turntoClient();
      //此处跳转到cilent客户端
    QList<QByteArray> lst;
    lst.clear();
    lst=buffer.split('#');
    qDebug()<<"lst"<<buffer;

        if(lst[0]=="denglu")
        {qDebug()<<"denglu";
            if(lst[1]=="yes")
            {qDebug()<<"yes";

                denglu=1;
                  emit nothing();
                return 1;
            }
            if(lst[1]=="no")
            {
                qDebug()<<"no";
             //   QMessageBox::about(NULL,"Fail","用户不存在或用户名密码错误");
                //此处不做改动要求重新填写
                denglu=0;
                  emit nothing();
                return 0;
            }
//            else if(lst[1]!="yes"||lst[1]!="no")
//            {
//                //如果没有从服务器收到正确的消息内容，则执行。
//              //  QMessageBox::about(NULL,"登陆失败","服务器连接异常，请检查网络连接状态后重启");
//                denglu=-1;
//                  emit nothing();
//                return -1;
//            }
        }

       // cread();
//        QString re=ui->rhcq->toPlainText();
//    QList<QString> lst;
//    lst.clear();
//    lst=re.split('#');
//  qDebug()<<"lst"<<re;
        if(lst[0]=="zhuce")
        {qDebug()<<"zhuce";
            if(lst[1]=="yes")
            {qDebug()<<"yes";
               // QMessageBox::about(NULL,"Welcome to lake of stars","注册成功");
                //this->close();
                //client=new Client;
                //client.show();
                denglu=1;
                  emit mmp();
                return 1;

            }
            if(lst[1]=="no")
            {
               // QMessageBox::about(NULL,"Fail","该用户已存在！请重新输入！");
                //此处不做改动要求重新填写

                denglu=0;
                  emit mmp();
                return 0;
            }
            else if(lst[1]!="yes"||lst[1]!="no")
            {
                //如果没有从服务器收到正确的消息内容，则执行。
              //  QMessageBox::about(NULL,"登陆失败","服务器连接异常，请检查网络连接状态后重启");
                denglu=-1;
                  emit mmp();
                return -1;
            }
        }
        if(lst[0]=="show")
        {
            qDebug()<<"接收到show，开始赋值";
            oname=tr(lst[1]);
            mesg=tr(lst[2]);
            qDebug()<<"复制完毕，发送信号appen";
            emit appen();
        }
        if(lst[0]=="askcount")
        {
            qDebug()<<"askcount执行"<<lst[1];
            m_count=lst[1].toInt();
            emit showc();
        }
        if(lst[0]=="askplc")
        {
            qDebug()<<"askplc执行,得到当前消息的评论数"<<lst[1];
            plc=lst[1].toInt();
            emit afterplc();
        }
        if(lst[0]=="showCmt")
        {

            qDebug()<<"接收到pinglun，开始赋值";
            pingl=tr(lst[1]);

            qDebug()<<"复制完毕，发送信号addpl";
            emit addpl();
        }
        if(lst[0]=="showCm")
        {
//该条评论内容获取；
            qDebug()<<"p评论的内容"<<pingl;
            qDebug()<<"接收到pinglun，开始赋值";
            pingl=tr(lst[1]);
    qDebug()<<"p评论的内容"<<pingl;
            qDebug()<<"复制完毕，发送信号addpl";
           // emit addpl();
           //  emit atxinhao();
            getatname();
        }

}

void TCPClient::getatname()
{
    QList<QString>lster;
    lster=pingl.split("】");
    atname=lster[0]+"】//";
    qDebug()<<"lster0"<<lster[0]<<"lster1"<<lster[1];
    emit atxinhao();
}
QString TCPClient::reatname()
{
    qDebug()<<"reatname返回atname"<<atname;
    return atname;

}

void TCPClient::hidepl1()
{
    emit hidepl();

}

void TCPClient::showplpl1()
{
    emit showplpl();

}
//void nothing ()
//{
//    qDebug()<<"nothing run";
//}
void TCPClient::login()
{
    //QMetaObject::invokeMethod(object,"judge",Q_RETURN_ARG(QVariant,returnedValue));
}


void TCPClient::createTcpConnect(){
    m_tcpsocket->abort();
    m_tcpsocket->connectToHost(m_ip,m_port);/*-<调用connectToHost函数连接指定的IP及端口号 */

    if(!m_tcpsocket->waitForConnected(3000))/*-<调用waitForConnected函数判断是否连接成功，ps：不加这个也能连上 */
    {
        qDebug() << "Connection failed!";
        emit notlianjie();
        //信号到登录界面，让他弹框
        return;
    }
}

void TCPClient::sendMsglogin(const QString name,const QString key){
    QString str="denglu#"+name+"#"+key+"#\n";
    m_name=name;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
    /*-< write函数执行后，其实不一定会把数据写入socket，
     * 可能要等到事件循环（main函数的return a.exec()）才会写入。
     * 如果需要立即写入，要执行QTcpSocket的flush函数。*/

}
void TCPClient::sendMsgregister(const QString name,const QString key){
    QString str="zhuce#"+name+"#"+key+"#\n";
    m_name=name;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
    /*-< write函数执行后，其实不一定会把数据写入socket，
     * 可能要等到事件循环（main函数的return a.exec()）才会写入。
     * 如果需要立即写入，要执行QTcpSocket的flush函数。*/

}
void TCPClient::shedMsgclient(const QString user,const QString msg)
{
    qDebug()<<"发送消息函数调用";
    QString str="xiaoxi#"+user+"#"+msg+"#\n";
    m_name=user;
    m_xy=msg;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
}
void TCPClient::askcount()
{
    qDebug()<<"求取数据库总值";
    QString str="askcount#\n";
    //m_name=name;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();

}

void TCPClient::askmsg(int i)
{

    qDebug()<<"askmsg执行；求取数据库每条消息的姓名和内容";
    QString str1="show#";
    QString str2="#\n";
    QString iii=QString::number(i,10);
    QString str=str1+iii+str2;
    //m_name=name;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
}
void TCPClient::askplc()
{
    qDebug()<<"求取数据库中对应语句的评论总值";
    QString plcc=QString::number(plnum+1,10);

    QString str="askplc#"+plcc+"#\n";
    //m_name=name;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
}
void TCPClient::plmsg(int n)
{

    qDebug()<<"plmsg执行；求取数据库每条消息的姓名和内容";
    QString str1="showCmt#";
    QString ccc=QString::number(plnum+1,10);
    QString nnn=QString::number(n,10);
    QString str2="#\n";

    QString str=str1+ccc+"#"+nnn+str2;
    //m_name=name;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
}
void TCPClient::plat(int n)
{

    qDebug()<<"plat执行；求取数据库此条评论的内容";
    QString str1="showCm#";
    QString ccc=QString::number(plnum+1,10);
    QString nnn=QString::number(n,10);
    QString str2="#\n";

    QString str=str1+ccc+"#"+nnn+str2;
    //m_name=name;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
}
void TCPClient::pinglun(QString txt)
{

    qDebug()<<"askmsg执行；求取数据库每条消息的姓名和内容";
    QString str1="pinglun#";
    QString str2="#\n";
    QString iii=QString::number(plnum+1,10);
    QString str3="【"+m_name+"】："+txt;
    QString str=str1+iii+"#"+str3+str2;
    //m_name=name;
    qDebug()<<"发送消息内容"<<str;
    m_tcpsocket->write(str.toUtf8()); /*-<调用write函数发送数据 */
    m_tcpsocket->flush();
    emit cleartxt();
}

void TCPClient::restolog()
{
    emit restolog1();
}

void TCPClient::logtores()
{
    emit logtores1();
}

void TCPClient::showlf1()
{
    emit showlf();
}

void TCPClient::showln1()
{
    emit showln();
}

void TCPClient::logintr1()
{
    emit logintr();
}

void TCPClient::relogin1()
{
    emit relogin();
}

void TCPClient::resuc1()
{
    emit resuc();
}

void TCPClient::jishi1()
{
    emit jishi();
}

QString TCPClient::jishiname()
{
    return m_name;
}

QString TCPClient::jishixy()
{
    return m_xy;
}

int TCPClient::plindex(int i)
{
    qDebug()<<"来自zzm给我的下表："<<i;
    plat(i+2);
    //emit getplnum();
    return i;
}



