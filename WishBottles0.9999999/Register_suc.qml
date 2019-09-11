import QtQuick 2.0
import TCPClient 1.0
Item {
    id:registersuc
    visible: true
    height: 25
    width: 4000

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 400
        height: 250
        color: "#eae8e8"
        opacity: 1

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
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.family: "微软雅黑"
                anchors.verticalCenterOffset: 0
                anchors.horizontalCenterOffset: 0
                font.bold: false
                //font.family: "Courier"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 17
            }
        }

        Text {
            id: element1
            x: 129
            y: 108
            width: 157
            height: 22
            text: qsTr("恭喜您，注册成功！")
            anchors.verticalCenterOffset: -10
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
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
            onClicked:{
                pageLoader_ToC.source = "Client_show.qml"
                        registersuc.visible=false
                        $TCPClient.closew()
                       $TCPClient.resuc1();
            }
        }

//        Loader{
//            id:pageloader_ToClient
//            width: 20
//            height: 30

//        }
        Loader{
            id:pageLoader_ToC
            x: -455
            y: -275
            width: 1280
            height: 800

        }

    }

}
