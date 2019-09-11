import QtQuick 2.0
//import QtQuick.Controls 2.5
import TCPClient 1.0

Item {
    id:loginView
    property alias row: row
    width: 1280
    height: 800
    //    TCPClient{
    //        id:tcp

    //    }

    //【【【设置背景界面】】】
    Image {
        id: login_background
        anchors.rightMargin: 0
        source: "backgrounds/lorr.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop

        Rectangle {
            id: mengban
            x: 0
            y: 0
            width: 1280
            height: 800
            color: "#3d3d3d"
            opacity: 0.4

            AnimatedImage {
                id: animatedImage
                x: 534
                y: 549
                width: 17
                height: 20
                source: "icons/zhuandao.png"
            }


        }

    }



    //【【【设置两个选择按钮】】】
    AnimatedImage {
        id: animatedImage1
        x: 590
        y: 190
        width: 100
        height: 100
        source: "icons/denglu.png"
    }

    Row{
        id: row
        x: 420
        y: 370
        width: 126
        height: 22
        anchors.verticalCenterOffset: 1
        anchors.leftMargin: 0
        anchors.verticalCenter: parent.verticalCenter;
        anchors.left: parent.left;
        //spacing: maLogin.spacing;

    }

    Rectangle{
        id: btnLogin;
        width: 220
        height: 35
        color: maLogin.containsMouse ? "#145b7d" : "#b7704f";
        radius: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 280
        anchors.horizontalCenter: parent.horizontalCenter

        property var myText: "";
        property var source: "";
        property var leftSpace: 10;
        property var spacing: 10;
        signal btnClicked();
        x: 380
        y: 320

        Text{
            id: txtLogin
            x: 1
            y: 3
            width: 91
            height: 34
            text:"登          录"
            elide: Text.ElideNone
            anchors.verticalCenter: parent.verticalCenter
            renderType: Text.QtRendering
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            opacity: 0.7
            font.wordSpacing: 1.6
            style: Text.Normal
            font.weight: Font.Normal
            font.bold: false
            font.pointSize: 11
            font.family: "微软雅黑"
            lineHeight: 0.8
            textFormat: Text.RichText
            fontSizeMode: Text.HorizontalFit
            color: "#ffffff"



        }

        MouseArea{
            id: maLogin;
            x: 300
            y: 440

            width: 90
            height: 35
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.fill: parent;
            hoverEnabled: true;


            onClicked:{
                $TCPClient.createTcpConnect()
                //tcp.createTcpConnect()
                $TCPClient.sendMsglogin(txtInput_name.text,txtInput_key.text)
                //tcp.sendMsglogin(txtInput_name.text,txtInput_key.text)

            }


            // qDebug()<<"before"
            //              function fuck()
            //              {
            //                    var i=tcp.rei()

            //                    if(i==1){
            //                        //登录成功
            //                        //qDebug()<<"111111";
            //                        pageloader_result.source="Login_success.qml"
            //                    }
            //                    else if(i==0){
            //                        //登录失败
            //                        pageloader_result.source="Login_fail.qml"

            //                    }
            //                    else if(i==-1){
            //                        //未连接到服务器
            //                        qDebug()<<"bug"
            //                        pageloader_result.source="Login_notconnect.qml"
            //                    }
            //                }
            Connections
            {
                //qml 连接 c++ 信号
                target:$TCPClient
                onNothing:
                {
                    //                         fuck()
                    //                         {
                    var i=$TCPClient.rei()

                    if(i==1){
                        //登录成功
                        //qDebug()<<"111111";
                        //7.1.更新by马草原，添加几句话避免后面bug

                        pageloader_result.source="Login_success.qml"
                        backtowelcome.visible=false
                        row.visible=false
                        btnLogin.visible=false
                        maRegister.visible=false
                        username.visible=false
                        key.visible=false
                        // login_background.visible=false

                        $TCPClient.relogin1()
                        //再次登录成功问题

                    }
                    else if(i==0){
                        //登录失败

                        pageloader_result.source="Login_fail.qml"

                    }
                    else if(i==-1){
                        //未连接到服务器
                        qDebug()<<"bug"
                        pageloader_result.source="Login_notconnect.qml"
                        $TCPClient.showln1();

                    }
                    //                           }
                }

            }
            //              Component.onCompleted:
            //              {
            //              TCPClient.nothing.connect(fuck);
            //              }




        }






    }



    Rectangle {
        id: username
        x: 250
        y: 331
        width: 220
        height: 30
        color: "#ffffff"
        radius: 5
        anchors.horizontalCenterOffset: 1
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 439
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 0
        opacity: 0.8

        TextInput {
            id: txtInput_name
            x: 5
            y: 0
            width: 207
            height: 25
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            readOnly: false
            //inputMask: qsTr("用户名")
            opacity: 1
            font.pixelSize: 19
            font.family: "微软雅黑"

        }

        Text {
            id: txtUsername
            x: -69
            y: 2
            color: "#ffffff"
            text: qsTr("用户名：")
            renderType: Text.NativeRendering
            font.pixelSize: 17
            font.family: "微软雅黑"

        }
    }

    MouseArea {
        id: maRegister
        x: 235
        y: 531
        width: 300
        height: 49
        anchors.horizontalCenterOffset: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 220
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked:
        {
            pageloader_ToRegister.source = "Register.qml"
            $TCPClient.logtores()
            //                loginView.visible=false
            row.visible=false
            btnLogin.visible=false
            maRegister.visible=false
            username.visible=false
            key.visible=false
        }

        Connections
        {
            target: $TCPClient
            onRestolog1:
            {
                //                    pageloader_ToLogin.source = "Login.qml"
                row.visible=true
                btnLogin.visible=true
                maRegister.visible=true
                username.visible=true
                key.visible=true
            }
        }

    }

    Text {
        id: txtRegister
        x: 560
        y: 546
        color: "#ffffff"
        text: qsTr("还没有账号？快去注册吧！")
        font.pixelSize: 15
        font.family: "微软雅黑"

    }


    Rectangle {
        id: key
        x: 164
        y: 390
        width: 220
        height: 29
        color: "#ffffff"
        radius: 5
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 0
        Text {
            id: txtKey
            x: -67
            y: 4
            height: 12
            color: "#ffffff"
            text: qsTr("密   码：")
            font.family: "微软雅黑"
            font.pixelSize: 17
            renderType: Text.NativeRendering
        }

        TextInput {
            id: txtInput_key
            x: 8
            y: 0
            width: 204
            height: 25
            anchors.verticalCenterOffset: 1
            anchors.verticalCenter: parent.verticalCenter
            //inputMask: qsTr("password")
            font.wordSpacing: -0.1
            font.weight: Font.Light
            font.pixelSize: 19
            font.family: "微软雅黑"
            echoMode:TextInput.Password


        }

        opacity: 0.8
    }

    Image {
        id: backtowelcome
        x: 18
        y: 18
        width: 39
        height: 37
        opacity: 0.7
        fillMode: Image.PreserveAspectFit
        source: "icons/fanhui.png"
        MouseArea
        {

            x: -12
            y: 0
            width: 46
            height: 46
            onClicked:
            {

                pageLoader_welcome.source = "welcome.qml"
                //                loginView.visible=false
                row.visible=false
                btnLogin.visible=false
                maRegister.visible=false
                username.visible=false
                key.visible=false
                login_background.visible=false
                //                btnToXD.visible=ture
                //                btnToXH.visible=ture
                //                rectangle.visible=ture
            }
        }



    }

    Connections{
        target: $TCPClient
        onNotlianjie:pageloader_result.source="Login_notconnect.qml"
    }

    Loader
    {
        id: pageLoader_welcome
        x: 0
        y: 0
        width: 1278
        height: 798
    }

    Loader
    {
        id: pageLoader_Tomain
        x: 0
        y: 7
        width: 1278
        height: 798
    }



    Loader{
        id:pageloader_ToRegister
        width: 1280
        height: 800


    }

    Loader{
        id:pageloader_result
        x: 441
        y: 310
        width: 400
        height: 250

    }


    //    function judge(qint64){

    //        if(i==1){
    //            //登录成功
    //           // qDebug()<<"111111";
    //            pageloader_result.source="Login_success.qml"
    //        }
    //        else if(i==0){
    //            //登录失败
    //            pageloader_result.source="Login_fail.qml"

    //        }
    //        else if(i==-1){
    //            //未连接到服务器
    //            pageloader_result.source="Login_notconnect.qml"
    //        }
    //    }


    //【【【星星闪烁动画】】】
    Rectangle {
        id: huxi1
        x: 200
        y: 100
        width: 35
        height: 35
        color: Qt.rgba(255,255,255,0)
        Timer {
            id: areaTimer
            property bool stateFlag: true
            interval: 1000; running: true; repeat: true
            onTriggered:  {
                console.log("areaTimer trigger")
                if(stateFlag) {
                    huxi1.state = "end";
                } else {
                    huxi1.state = "begin";
                }
                stateFlag = !stateFlag;
            }
        }

        Image {
            id: img
            x: 32
            y: 8
            width: parent.width
            height: width
            fillMode: Image.PreserveAspectFit
            opacity: 1
            source: "images/star3.png"
        }

        state: "begin"
        states: [
            State {
                name: "begin"
                PropertyChanges { target: img; opacity: 1.0 }
            },
            State {
                name: "end"
                PropertyChanges { target: img; opacity: 0.0 }
            }
        ]
        transitions: [
            Transition {
                from: "begin"; to: "end"
                PropertyAnimation {target: img; properties: "opacity"; duration: 1000}
            },
            Transition {
                from: "end"; to: "begin"
                PropertyAnimation {target: img; properties: "opacity"; duration: 1000}
            }
        ]
    }


       Connections{
           target: $TCPClient
           onLogintr:{
//               row.visible=true
               btnLogin.visible=true
               maRegister.visible=true
               username.visible=true
               key.visible=true
               row.visible=true
               backtowelcome.visible=true

           }
       }





       Rectangle {
           id: huxi2
           x: 800
           y: 30
           width: 34
           height: 40
           color: Qt.rgba(255,255,255,0)
           Timer {
               id: areaTimer2
               property bool stateFlag: true
               interval: 1000; running: true; repeat: true
               onTriggered:  {
                   console.log("areaTimer trigger")
                   if(stateFlag) {
                       huxi2.state = "end";
                   } else {
                       huxi2.state = "begin";
                   }
                   stateFlag = !stateFlag;
               }
           }

           Image {
               id: img2
               x: 33
               y: 8
               width: parent.width
               height: width
               fillMode: Image.PreserveAspectFit
               opacity: 0.85
               source: "images/star5.png"
           }

           state: "begin"
           states: [
               State {
                   name: "begin"
                   PropertyChanges { target: img2; opacity: 0.0 }
               },
               State {
                   name: "end"
                   PropertyChanges { target: img2; opacity: 0.85 }
               }
           ]
           transitions: [
               Transition {
                   from: "begin"; to: "end"
                   PropertyAnimation {target: img2; properties: "opacity"; duration: 2000}
               },
               Transition {
                   from: "end"; to: "begin"
                   PropertyAnimation {target: img2; properties: "opacity"; duration: 2000}
               }
           ]
       }






}

























/*##^## Designer {
    D{i:5;invisible:true}D{i:12;invisible:true}
}
 ##^##*/
