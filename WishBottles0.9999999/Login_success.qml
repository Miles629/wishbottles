import QtQuick 2.0

Item {
    id:login_successed
    visible: true
    width: 400
    height: 250


    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 400
        height: 250
        color: "#eae8e8"
        opacity: 0.9

        Rectangle {
            id: rectangle1
            x: 152
            y: 183
            width: 96
            height: 38
            color: "#2c49aa"
            radius: 6
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 0.8

            Text {
                id: element
                x: 19
                y: 13
                width: 46
                height: 17
                color: "#ffffff"
                text: "确  定"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: false
                font.family: "微软雅黑"
                font.pixelSize: 17
            }
        }

        Text {
            id: element1
            x: 129
            y: 108
            width: 157
            height: 22
            text: qsTr("恭喜您，登录成功！")
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "微软雅黑"
            font.pixelSize: 17
        }



        MouseArea {
            id: mouseArea
            x: 150
            y: 183
            width: 100
            height: 38

            onClicked:
            {

                $TCPClient.hidecs1()
               // $TCPClient.cread()
                pageLoader_ToLogin.source = "Client_show.qml"
               // $TCPClient.cread()
                login_successed.visible=false
               // $TCPClient.cread()
                $TCPClient.closeww()


            }
        }

    }


    Loader{
        id:pageLoader_ToLogin
        x: -455
        y: -275
        width: 1280
        height: 800

    }

    Connections{
        target: $TCPClient
        onRelogin:login_successed.visible=true
    }
}
