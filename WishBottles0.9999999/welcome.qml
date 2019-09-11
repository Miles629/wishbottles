import QtQuick 2.0

Item {
    id:welcome
    visible: true

    width: 1280
    height: 800

    Rectangle {
        id: rectangle
        x: 2
        y: -4
        width: 1278
        height: 809
        color: "#000000"

        AnimatedImage {
            id: animatedImage
            x: 0
            y: 0
            width: 1280
            height: 809
            source: "backgrounds/log9.gif"

            //创建对象

        }
    }

    MouseArea {
        id: maToXH
        x: 720
        y: 550
        width: 162
        height: 45
        opacity: 1
        onClicked:{
            pageLoader_ToLogin.source = "Login.qml"
            btnToXD.visible=false
            btnToXH.visible=false
            rectangle.visible=false

        }
        onReleased: {
            btnToXH.color="#f47a55"
        }

        Rectangle {
            id: btnToXH
            x: 0
            y: 0
            width: maToXH.containsMouse?166:162
            height: maToXH.containsMouse?49:45
            color: maToXH.containsMouse?"#2570A1":"#f47a55"
            radius: 8

            Text {
                id: txtToXH
                x: 33
                y: 6
                width: 84
                height: 23
                color: "#ffffff"
                text: qsTr("进入星湖")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.family: "微软雅黑"
                horizontalAlignment: Text.AlignHCenter
                //font.family: fontCu
                elide: Text.ElideNone
                font.pixelSize: maToXH.containsMouse?19:18
                verticalAlignment: Text.AlignVCenter
            }
            opacity: 0.7
        }
    }

    MouseArea {
        id: maToXD
        x: 430
        y: 550
        width: 162
        height: 45
        onClicked:{
            pageLoader_ToXD.source="XD.qml"
            //start.visible=false
            btnToXD.visible=false
            btnToXH.visible=false
            rectangle.visible=false
            $XD.resetnum()
            $XD.getlstc();
        }

        Rectangle {
            id: btnToXD
            x: 0
            y: 0
            width: maToXD.containsMouse?166:162//162
            height: maToXD.containsMouse?49:45//45
            color: maToXD.containsMouse?"#2570a1":"#f47a55"
            radius: 8
            opacity: 0.7


            Text {
                id: txtToTD
                x: 26
                y: 6
                width: 98
                height: 23
                color: "#ffffff"
                text: qsTr("进入星洞")
                font.letterSpacing: 0
                font.wordSpacing: 0
                font.weight: Font.Normal
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.family: "微软雅黑"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideNone
                font.pixelSize:maToXD.containsMouse?19: 18


            }





        }
    }

    //FontLoader { id: fontXi; source: "./fonts/FZXH1JW.TTF" }


    //【【【跳转到登录界面】】】
    //    Item {
    //        id:start1
    //        x: 750
    //        y: 660
    //        width: 150
    //        height: 35


    //    }

    Loader {
        id: pageLoader_ToLogin ;
        x: 0
        y: 0
        width: 1280
        height: 800
    }

    Loader {
        id: pageLoader_ToXD
        x: 0
        y: 0
        width: 1280
        height: 800
    }




}
