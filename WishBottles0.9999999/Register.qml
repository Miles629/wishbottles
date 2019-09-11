import QtQuick 2.0
import TCPClient 1.0
Item {
    id: element

    visible: true
    width: 1280
    height: 800
//    TCPClient{
//        id:tcp

//    }

    //【【【设置背景界面】】】
    Image {
        id: register_background
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

            Image {
                id: image
                x: 10
                y: 10
                width: 45
                height: 45
                opacity: 0.7
                source: "icons/fanhui.png"
                fillMode: Image.PreserveAspectFit

                MouseArea {
                    id: mouseArea
                    x: 0
                    y: 0
                    width: 45
                    height: 45
                    opacity: 0.7
                    onClicked: {

                        $TCPClient.restolog()
                        register_background.visible = false

                    }
                }


        }
            Connections
            {
                target: $TCPClient
                onLogtores1:
                {
//                    pageloader_ToRegister.source="Register.qml"
                    register_background.visible = true
                }



        }

    }



    AnimatedImage {
        id: animatedImage1
        x: 590
        y: 190
        width: 100
        height: 100
        source: "icons/denglu.png"
    }

    Rectangle {
        id: key
        x: 530
        y: 380
        width: 220
        height: 29
        color: "#ffffff"
        radius: 5
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 0
        Text {
            id: txtKey
            x: -80
            y: 3
            width: 83
            height: 24
            color: "#ffffff"
            text: qsTr("密       码：")
            font.bold: false
            font.family: "微软雅黑"
            font.pixelSize: 17
            renderType: Text.NativeRendering
        }

        TextInput {
            id: txtInput_key
            width: 210
            height: 25
            anchors.horizontalCenter: parent.horizontalCenter
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


    Rectangle{
        id: btnLogin;
        width: 220
        height: 35
        color: maLogin.containsMouse ? "#145b7d" : "#b7704f";
        radius: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 250
        opacity: 0.9
        anchors.horizontalCenter: parent.horizontalCenter

        property var myText: "";
        property var source: "";
        property var leftSpace: 10;
        property var spacing: 10;
        signal btnClicked();
        x: 530
        y: 0


        Text{
            id: txtLogin
            x: 1
            y: 3
            width: 135
            height: 34
            text:"确           定"
            font.capitalization: Font.MixedCase
            anchors.verticalCenterOffset: -1
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            renderType: Text.QtRendering
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
            y: 445

            width: 90
            height: 35
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.rightMargin: 0
            anchors.bottomMargin: 0
            anchors.fill: parent;
            hoverEnabled: true;
            onClicked:
            {
                $TCPClient.createTcpConnect()
                confirm()


            }
            function confirm()
            {
                if(txtInput_confirmkey.text==txtInput_key.text)
                {
                    $TCPClient.sendMsgregister(txtInput_name.text,txtInput_key.text)
                }
                else
                {
                    //请保持密码一致！
                    $TCPClient.cread()
                    pageloader_result2.source="Register_chk.qml"
                }
            }

            Connections
            {
                //qml 连接 c++ 信号
                target:$TCPClient
                onMmp:
                {
                    //                         fuck()
                    //                         {
                    var i=$TCPClient.rei()

                    if(i==1){
                        //注册成功
                        //qDebug()<<"111111";
                        pageloader_result2.source="Register_suc.qml"
                    }
                    else if(i==0){
                        //注册失败，提示该用户名已存在
                        pageloader_result2.source="Register_fail.qml"

                    }
                    else if(i==-1){
                        //未连接到服务器
                        qDebug()<<"bug"
                        //这块我加了一句话
                        $TCPClient.showlf1();
                        pageloader_result2.source="Login_notconnect.qml"
                    }
                    //                           }
                }

            }





        }


    }


    Rectangle {
        id: confirmkey
        x: 534
        y: 430
        width: 220
        height: 29
        color: "#ffffff"
        radius: 5
        anchors.horizontalCenterOffset: 0
        border.width: 0
        opacity: 0.8
        Text {
            x: -79
            y: 2
            width: 84
            height: 22
            color: "#ffffff"
            text: qsTr("确认密码：")

            font.bold: false
            font.family: "微软雅黑"
            renderType: Text.NativeRendering
            font.pixelSize: 17
        }

        TextInput {
            id: txtInput_confirmkey
            x: 0
            width: 210
            height: 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenterOffset: 0
            anchors.verticalCenter: parent.verticalCenter
            font.family: "微软雅黑"
            font.weight: Font.Light
            font.wordSpacing: -0.1
            font.pixelSize: 19
            echoMode:TextInput.Password

        }
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: username
        x: 531
        y: 330
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
            x: 0
            y: 3
            width: 210
            height: 25
            anchors.horizontalCenter: parent.horizontalCenter
            readOnly: false
            font.family: "微软雅黑"
            //inputMask: qsTr("用户名")
            opacity: 1
            font.pixelSize: 19

        }

        Text {
            id: txtUsername
            x: -79
            y: 3
            color: "#ffffff"
            text: qsTr("用 户 名 ：")
            font.family: "微软雅黑"
            renderType: Text.NativeRendering
            font.pixelSize: 17
        }
    }

    Loader{
        id:pageloader_result2
        x: 440
        y: 320
        width: 400
        height: 250

    }

//    Connections{
//        target: $TCPClient
//        onToregis:
//    }




}
}
