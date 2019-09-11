#ifndef TCP_H
#define TCP_H
#include <QObject>
#include <QTcpSocket>
class TCPClient : public QObject
{
    Q_OBJECT
public:
    //20tips
    TCPClient();
    ~TCPClient();
    Q_INVOKABLE void setIP(const QString ip);
    QString getIP(){return m_ip;}
    Q_INVOKABLE void setPort(const int port);
    int getPort(){return m_port;}
    Q_INVOKABLE qint64 getMsg();
    void onConnected();
     Q_INVOKABLE     int denglu;
     Q_INVOKABLE QString m_name;
    Q_INVOKABLE int m_count;
    Q_INVOKABLE QString mesg;
    Q_INVOKABLE QString m_xy;
    Q_INVOKABLE int n;
    Q_INVOKABLE QString oname;
    Q_INVOKABLE int plnum;//当前消息下标
    Q_INVOKABLE int plc;//当前下标之下的评论总数
    Q_INVOKABLE int pln;//返回的第几条评论
    Q_INVOKABLE QString pingl;//当前循环评论
    Q_INVOKABLE QString atname;
public slots:
    //50tips
    void createTcpConnect();
    void sendMsglogin(const QString msg,const QString key);
     void sendMsgregister(const QString msg,const QString key);
     void shedMsgclient(const QString msg,const QString key);
    int rei();
    QString rename();
    void login();
    void cread();
    void closeww();//login成功确定发送信号
    int recount();
    QString remsg();
    void askcount();
    void askmsg(int i);
    void reask();
    int ren();
    void nadd1();
    QString myname();
    void showpl(int now);
   // void askpl();
    void askplc();
    int repln();
    int replc();
    void plmsg(int n);
    void plnadd1();
    QString repl();
    void reaskpl();
    void resetpln();
    void pinglun(QString);
    void wypl(int i);
    void toregis1();
    void cstoc1();
    void ctocs1();
    void showw1();
    void hidecs1();
    void restolog();
    void logtores();
    void showlf1();//再次加载login_fail窗口
    void showln1();
    void logintr1();
    void relogin1();
    void resuc1();
    void jishi1();
    QString jishiname();
    QString jishixy();
    int plindex(int i);
    void plat(int i);
    void getatname();
    QString reatname();
    void hidepl1();
    void showplpl1();


signals:
    //31tip
    void showMsg(const QString &msg);
    Q_INVOKABLE void qthing();
    Q_INVOKABLE void mmp();
    Q_INVOKABLE void nothing();
    Q_INVOKABLE void closew();
    Q_INVOKABLE void showc();
     Q_INVOKABLE void appen();
    Q_INVOKABLE void again();
    Q_INVOKABLE void showpl2();
    Q_INVOKABLE void afterplc();
    Q_INVOKABLE void addpl();
    Q_INVOKABLE void plagain();
    Q_INVOKABLE void cleartxt();
    Q_INVOKABLE void restolog1();
    Q_INVOKABLE void logtores1();
    Q_INVOKABLE void notlianjie();
    Q_INVOKABLE void toregis();
    Q_INVOKABLE void cstoc();
    Q_INVOKABLE void ctocs();
    Q_INVOKABLE void showw();
    Q_INVOKABLE void hidecs();
    Q_INVOKABLE void showlf();
    Q_INVOKABLE void showln();
    Q_INVOKABLE void logintr();
    Q_INVOKABLE void relogin();
    Q_INVOKABLE void resuc();
    Q_INVOKABLE void jishi();
    Q_INVOKABLE void atxinhao();
    Q_INVOKABLE void hidepl();
    Q_INVOKABLE void showplpl();
    Q_INVOKABLE void getplnum();



private:
    //3tips
    QTcpSocket *m_tcpsocket;
    QString m_ip;
    int m_port;
};

#endif // TCP_H
