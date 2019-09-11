import QtQuick 2.0


Item {
    id:client
    visible: true
    width: 1280
    height: 800

    AnimatedImage {
        id: clientImage
        x: 0
        y: 0
        width: 1280
        height: 800
        opacity: 1
        source: "backgrounds/xh.jpg"

        AnimatedImage {
            id: animatedImage
            x: 37
            y: 34
            width: 41
            height: 41
            source: "icons/fanhui.png"
        }

        MouseArea {
            id: ma_ctocshow
            x: 32
            y: 27
            width: 52
            height: 54
            onClicked: //跳转到cshow，让cshow  true
            {
               //pageloader_ctocs.source="Client_show.qml"
               $TCPClient.cstoc();
                client.visible=false
            }
        }
        Connections{
            target: $TCPClient
            onCtocs:client.visible=true
        }


    }
    Rectangle {
        id: rectangle
        x: 553
        y: 170
        width: 380
        height: 50
        color: "#ffffff"
        radius: 8
        anchors.left: parent.left
        anchors.leftMargin: 178
        opacity: 0.3
    }

    Rectangle {
        id: txtInput
        x: 178
        y: 248
        width: 898
        height: 296
        color: "#ffffff"
        radius: 6
        opacity: 0.7

        TextInput {
            id: xinyuan_write
            x: 8
            y: 8
            width: 882
            height: 280
            opacity: 1
            font.pixelSize: 24
            font.family: "微软雅黑"
            wrapMode: TextInput.WordWrap
        }


        //        Rectangle{
        //            id:bodyleft
        //            height:ctxLH*(tt.lineCount-1)+35
        //            implicitWidth:Math.min(fitWidth(tt.text),root.width*0.6)
        //            anchors.left: imgl1.right
        //            color:"white"
        //            radius:5
        //            Item{
        //                anchors.margins: 10
        //                anchors.fill: parent
        //                anchors.verticalCenter: parent.verticalCenter
        //                Text{
        //                    id:tt
        //                    anchors.fill: parent
        //                    text:label
        //                    wrapMode: fitWidth(tt.text)>root.width*0.6?Text.WrapAnywhere:Text.NoWrap
        //                }
        //            }
        //                    function fitWidth(text){
        //                        return  fontMetrics.advanceWidth(text);
        //                    }

        //        }

    }
    Row {
        //【【【表情添加区】】】
        id: biaoqing
        x: 187
        y: 167
        width: 379
        height: 59

        Text {
            id: liezui
            width: 61
            height: 60
            text: qsTr("😀")
            font.pixelSize: 37


            MouseArea {
                id: ma_liezui
                x: 0
                y: 0
                width: 58
                height: 59
                onClicked: xinyuan_write.text=xinyuan_write.text+ qsTr("😀")

            }
        }

        Text {
            id: zhoumei
            width: 61
            height: 60
            text: qsTr("😔")
            font.pixelSize: 37

            MouseArea {
                id: ma_zhoumei
                x: 0
                y: 0
                width: 54
                height: 59
                onClicked: xinyuan_write.text=xinyuan_write.text+ qsTr("😔")
            }
        }

        Text {
            id: shangxin
            width: 61
            height: 60
            text: qsTr("😟")
            font.pixelSize: 37
            font.family:"微软雅黑"


            MouseArea {
                id: ma_shangxin
                x: 0
                y: 0
                width: 53
                height: 59
                onClicked: xinyuan_write.text=xinyuan_write.text+ qsTr("😟")
            }
        }

        Text {
            id: kuqi
            width: 61
            height: 60
            text: qsTr("😭")
            font.pixelSize: 37

            MouseArea {
                id: ma_kuqi
                x: 0
                y: 0
                width: 59
                height: 59
                onClicked: xinyuan_write.text=xinyuan_write.text+ qsTr("😭")
            }
        }

        Text {
            id: daxiao
            width: 61
            height: 60
            text: qsTr("😃")
            font.pixelSize: 37

            MouseArea {
                id: ma_daxiao
                x: 0
                y: 0
                width: 60
                height: 59
                onClicked: xinyuan_write.text=xinyuan_write.text+ qsTr("😃")
            }
        }

        Text {
            id: weixiao
            width: 61
            height: 60
            text: qsTr("😊")
            font.pixelSize: 37

            MouseArea {
                id: ma_weixiao
                x: 0
                y: 0
                width: 64
                height: 59
                onClicked: xinyuan_write.text=xinyuan_write.text+ qsTr("😊")
            }
        }







    }


    Rectangle {
        id: send
        x: 876
        y: 579
        width: 200
        height: 42
        //color: "#ec8d65"
        color: maSend.containsMouse ? "#145b7d" : "#ec8d65";
        radius: 6
        opacity: 0.9


        Text {
            id: element
            x: 50
            y: 0
            width: 102
            height: 34
            color: "#ffffff"
            text: qsTr("发  送")
            font.family: "微软雅黑"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 23
        }

        MouseArea {
            id: maSend
            x: 0
            y: 0
            width: 200
            height: 42

            onClicked:
            {

                //$TCPClient.createTcpConnect()
                $TCPClient.shedMsgclient($TCPClient.myname(),xinyuan_write.text)
                // xinyuan_write.
                $TCPClient.jishi1();
                xinyuan_write.text=""

            }
            ////发送信息 此时调用另一个qml里的function add()



        }
    }

       Loader{
           id:pageloader_ctocs
           width: 1280
           height: 800
       }























}
